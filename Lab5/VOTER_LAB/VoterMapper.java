package Voter;

import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.IntWritable;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;



import java.io.IOException;
import java.util.StringTokenizer;

public class VoterMapper  extends Mapper <LongWritable,Text,Text,IntWritable> {
   String tempString=null;
   private static Log log = LogFactory.getLog(VoterMapper.class);

   public void map(LongWritable key, Text value, Context context) throws IOException, InterruptedException {
      // create iterator over record assuming space-separated fields
      StringTokenizer iterator = new StringTokenizer(value.toString(),",");

      // TODO check number of tokens in iterator 
      
      // TODO increment "wrong number of fields" counter and return if incorrect 
     
      // TODO eat up the first two tokens 
      
      // TODO convert age to int 
     
      // TODO validate age is a reasonable age
      
      // TODO increment "bad age" counter and return if bad
     
      // TODO convert age to IntWritable

      // TODO pull out party  from record      

      // TODO emit key-value as party-age
      
   }

}
