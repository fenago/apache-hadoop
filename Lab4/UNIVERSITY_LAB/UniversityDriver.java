package University; 

import java.util.*;

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


public class UniversityDriver extends Configured implements Tool {

   public int run(String[] args) throws Exception {
      // TODO: check the CLI

      // TODO: instantiate a new job with a unique name
      
      // TODO: define driver, mapper, and reducer classes in job

      // TODO: define input format for job

      // TODO: define record delimiter in input format class to "))" 

      // TODO define output key and output value class

      // TODO define input and output paths

      // TODO: launch job synchronously
   }

   public static void main(String[] args) throws Exception { 
      // TODO: instantiate a new configuration object

      // TODO: call the ToolRunner run() method
   } 
}
