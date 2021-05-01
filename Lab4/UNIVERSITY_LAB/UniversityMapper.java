package University;

import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.IntWritable;

import java.io.IOException;
import java.util.StringTokenizer;



public class UniversityMapper  extends Mapper <LongWritable,Text,Text,IntWritable> {
   public void map(LongWritable key, Text value, Context context) throws IOException, InterruptedException {
      // TODO convert record (value) to String

      // TODO determine if the record contains fields for both "sat verbal" AND "sat math"
      //  if it does not, skip this record

      //  if it does, then tokenize record 
      
      // sample record:
    /* (def-instance Adelphi
   (state newyork)
   (control private)
   (no-of-students thous:5-10)
   (male:female ratio:30:70)
   (student:faculty ratio:15:1)
   (sat verbal 500)
   (sat math 475)
   (expenses thous$:7-10)
   (percent-financial-aid 60)
   (no-applicants thous:4-7)
   (percent-admittance 70)
   (percent-enrolled 40)
   (academics scale:1-5 2)
   (social scale:1-5 2)
   (quality-of-life scale:1-5 2)
   (academic-emphasis business-administration)
   (academic-emphasis biology*/

      // TODO iterate through tokens until you find "sat verbal" field 
      // When you find it, break out of the loop.
      


      // TODO split the "sat verbal" field token

      // TODO pull out the score from the "sat verbal" field
      

      // TODO continue iterating through iterator  until you find "sat math" field
      // when you find it, break out of the loop.

      // TODO split the "sat math" field token
      
      // TODO pull out the score from the "sat math" field
 

      // TODO emit key-value as  "satv", score
      // TODO emit key-value as "satm", score
      
   }
}
