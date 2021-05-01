package University;

import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.FloatWritable;
import org.apache.hadoop.io.IntWritable;
import java.io.IOException;


public class UniversityReducer  extends Reducer <Text,IntWritable,Text,FloatWritable> {

   public void reduce(Text key, Iterable<IntWritable> values, Context context) throws IOException, InterruptedException {

     // TODO loop through the values and calculate min, max, and mean

     // TODO emit keystring_min, min
     // TODO emit keystring_max, max
     // TODO emit keystring_mean, mean
   }
}
