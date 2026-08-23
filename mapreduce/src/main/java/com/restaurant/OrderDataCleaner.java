package com.restaurant;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

import java.io.IOException;

/**
 * MapReduce程序：清洗餐厅订单数据
 * 功能：
 * 1. 过滤无效记录（订单金额缺失或为负）
 * 2. 解析为结构化字段
 * 3. 输出清洗后的数据
 */
public class OrderDataCleaner {

    /**
     * Mapper类：读取原始订单日志，进行数据清洗和解析
     */
    public static class OrderCleanMapper extends Mapper<LongWritable, Text, Text, NullWritable> {

        private Text outputKey = new Text();
        private NullWritable outputValue = NullWritable.get();

        @Override
        protected void map(LongWritable key, Text value, Context context) 
                throws IOException, InterruptedException {
            
            String line = value.toString().trim();
            
            // 跳过空行
            if (line.isEmpty()) {
                return;
            }

            // 解析订单数据
            // 格式: order_id|user_id|store_id|dish_list|order_time|amount
            String[] fields = line.split("\\|");
            
            // 验证字段数量
            if (fields.length != 6) {
                context.getCounter("DataCleaner", "INVALID_FIELD_COUNT").increment(1);
                return;
            }

            String orderId = fields[0].trim();
            String userId = fields[1].trim();
            String storeId = fields[2].trim();
            String dishList = fields[3].trim();
            String orderTime = fields[4].trim();
            String amountStr = fields[5].trim();

            // 验证必填字段
            if (orderId.isEmpty() || userId.isEmpty() || storeId.isEmpty() || 
                dishList.isEmpty() || orderTime.isEmpty() || amountStr.isEmpty()) {
                context.getCounter("DataCleaner", "MISSING_REQUIRED_FIELD").increment(1);
                return;
            }

            // 验证金额
            double amount;
            try {
                amount = Double.parseDouble(amountStr);
            } catch (NumberFormatException e) {
                context.getCounter("DataCleaner", "INVALID_AMOUNT_FORMAT").increment(1);
                return;
            }

            // 过滤负金额
            if (amount <= 0) {
                context.getCounter("DataCleaner", "NEGATIVE_OR_ZERO_AMOUNT").increment(1);
                return;
            }

            // 解析菜品列表，为每个菜品生成一条记录
            String[] dishes = dishList.split(",");
            for (String dishId : dishes) {
                dishId = dishId.trim();
                if (!dishId.isEmpty()) {
                    // 输出格式: user_id,order_id,store_id,dish_id,order_time,amount
                    String cleanedRecord = String.format("%s,%s,%s,%s,%s,%.2f",
                            userId, orderId, storeId, dishId, orderTime, amount);
                    outputKey.set(cleanedRecord);
                    context.write(outputKey, outputValue);
                    context.getCounter("DataCleaner", "VALID_RECORDS").increment(1);
                }
            }
        }
    }

    /**
     * Reducer类：直接输出Mapper的结果（去重）
     */
    public static class OrderCleanReducer extends Reducer<Text, NullWritable, Text, NullWritable> {

        @Override
        protected void reduce(Text key, Iterable<NullWritable> values, Context context) 
                throws IOException, InterruptedException {
            // 直接输出，自动去重
            context.write(key, NullWritable.get());
        }
    }

    /**
     * Driver主程序
     */
    public static void main(String[] args) throws Exception {
        // 打印参数数量和每个参数
        System.out.println("========== 参数调试信息 ==========");
        System.out.println("参数数量：" + args.length);
        for (int i = 0; i < args.length; i++) {
            System.out.println("参数" + (i+1) + "：[" + args[i] + "]");
        }
        System.out.println("==================================");

        if (args.length != 2) {
            System.err.println("Usage: OrderDataCleaner <input path> <output path>");
            System.exit(-1);
        }

        Configuration conf = new Configuration();
        Job job = Job.getInstance(conf, "Restaurant Order Data Cleaner");

        job.setJarByClass(OrderDataCleaner.class);
        job.setMapperClass(OrderCleanMapper.class);
        job.setReducerClass(OrderCleanReducer.class);

        job.setOutputKeyClass(Text.class);
        job.setOutputValueClass(NullWritable.class);

        FileInputFormat.addInputPath(job, new Path(args[0]));
        FileOutputFormat.setOutputPath(job, new Path(args[1]));

        boolean success = job.waitForCompletion(true);
        
        if (success) {
            System.out.println("========== 数据清洗完成 ==========");
            System.out.println("输入路径: " + args[0]);
            System.out.println("输出路径: " + args[1]);
        }
        
        System.exit(success ? 0 : 1);
    }
}

