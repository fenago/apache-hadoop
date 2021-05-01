package WholeJob; 


import org.apache.hadoop.conf.Configured;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.util.Tool;
import org.apache.hadoop.util.ToolRunner;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;

import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.filecache.DistributedCache;
import java.io.BufferedReader;
import java.io.FileReader;

public class WholeJobDriver extends Configured implements Tool {

   public int run(String[] args) throws Exception {

      // declare globals
      Job job;
      // run first job on university data
      getConf().set("textinputformat.record.delimiter","))");
      job = new Job(getConf(), "university" + System.getProperty("user.name"));
      
      //TODO Set Mapper, Driver and Reduer classes for the first job(university)
      
      //TODO Set Input Format, Output Key and output value classes for university Job

      //TODO  setup input and output paths for University job
 
      //TODO launch the first job synchronously

      // put results from first job in distributed cache  
      FileSystem fs = FileSystem.get(getConf());
      Path resultsFile = new Path(args[1] + "/part-r-00000");
      fs.copyFromLocalFile(resultsFile, new Path("/user/user01/8/DISTRIBUTED_CACHE/stats.txt"));
      DistributedCache.addCacheFile(resultsFile.toUri(), getConf());


      // setup the second job 
      getConf().set("textinputformat.record.delimiter","))");
      job = new Job(getConf(), "stats" + System.getProperty("user.name"));
     
     //TODO set mapper, driver and reducer classes for the second job(stat)
    
     
      //TODO set inputformat, output key and output value classes for stat job

     
      //TODO  setup input and output paths for stat job
     
      //TODO launch the second job synchronously
   



       String var1 = getConf().get("var1");
       String var2 = getConf().get("var2");
      String line;
      String[] lineArray;
      double var1_sumofsquares=0;
      double var2_sumofsquares=0;
      double product_sumofsquares=0;

      try{
      BufferedReader cacheReader = new BufferedReader(new FileReader(args[2] + "/part-r-00000"));
         while((line=cacheReader.readLine())!=null) {
            // find firstVar_sumofsquares 
            if(line.contains(var1)) {
               lineArray = line.split("\\s+");
               var1_sumofsquares = Double.parseDouble(lineArray[1]);
            }
            // find secondVar_sumofsquares
            else if(line.contains(var2)) {
               lineArray = line.split("\\s+");
               var2_sumofsquares = Double.parseDouble(lineArray[1]);
            }
            // find product_sumofsquares
            else if(line.contains("product")) {
               lineArray = line.split("\\s+");
               product_sumofsquares = Double.parseDouble(lineArray[1]);
            }
         }
       }
      catch(Exception e) { e.printStackTrace(); }

      double spearmanCoefficient = product_sumofsquares / Math.sqrt(var1_sumofsquares * var2_sumofsquares);
      
      System.out.println("product_sumofsquares is " + product_sumofsquares);
      System.out.println("var1_sumofsquares is " + var1_sumofsquares);
      System.out.println("var2_sumofsquares is " + var2_sumofsquares);

      System.out.println("spearman's coefficient is " + spearmanCoefficient);      

      //TODO return 0 or 1 based on the return codes from your two jobs
 

     
   }

   public static void main(String[] args) throws Exception { 
      Configuration conf = new Configuration();
      System.exit(ToolRunner.run(conf, new WholeJobDriver(), args));
   } 
}
