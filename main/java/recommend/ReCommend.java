package recommend;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.Arrays;



public class ReCommend {
    public static void main(String[] args) {
        String csvFile = "C:\\Users\\csv\\recomm_df.csv";  // �떎�젣 �뙆�씪 寃쎈줈濡� 蹂�寃쏀븯�꽭�슂.
        String line;
        String csvSplitBy = ",";

        try (BufferedReader br = new BufferedReader(new FileReader(csvFile))) {
            // 泥� 踰덉㎏ �씪�씤�� �뿤�뜑�씠誘�濡� 嫄대꼫�쎍�떎.
            br.readLine();

            while ((line = br.readLine()) != null) {
                // �씪�씤�쓣 援щ텇�옄濡� 遺꾨━�븯�뿬 諛곗뿴濡� 蹂��솚�븳�떎.
                String[] fields = line.split(csvSplitBy);

                // ID 
                String id = fields[0];

               
                // 異붿쿇 由ъ뒪�듃 �븘�뱶 (臾몄옄�뿴�쓣 諛곗뿴濡� 蹂��솚)
                String recommendations = fields[1];
                recommendations = recommendations.substring(1, recommendations.length() - 1);  // ��愿꾪샇 �젣嫄�
                String[] recommList = recommendations.split(", ");

                // 遺꾨━�맂 �븘�뱶瑜� 泥섎━�븳�떎. �뿬湲곗뿉�꽌�뒗 媛� �븘�뱶瑜� 異쒕젰�븳�떎.
                System.out.println("ID: " + id);
                System.out.println("Recommendations: " + Arrays.toString(recommList));
                System.out.println("-------------------------------");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}