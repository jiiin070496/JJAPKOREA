package kh.lclass.jjapkorea.api;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.client.HttpClient;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.File;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.net.URLEncoder;

public class AligoSMSExample {
    public static void main(String[] args) {
        try {
            final String encodingType = "utf-8";
            final String boundary = "____boundary____";

            /**************** 문자전송하기 예제 ******************/
            /* "result_code":결과코드,"message":결과문구, */
            /* "msg_id":메세지ID,"error_cnt":에러갯수,"success_cnt":성공갯수 */
            /* 동일내용 > 전송용 입니다. */
            /******************** 인증정보 ********************/
            String sms_url = "https://apis.aligo.in/send/"; // 전송요청 URL

            Map<String, String> sms = new HashMap<String, String>();

            sms.put("user_id", "pyr980227"); // SMS 아이디
            sms.put("key", "5dyg8p88awwdw8lvgxi60cef2zhp5jws"); // 인증키

            /******************** 인증정보 ********************/

            /******************** 전송정보 ********************/
            sms.put("msg", "%고객명%님. 안녕하세요. API TEST SEND"); // 메세지 내용
//            sms.put("receiver", "01111111111,01111111112"); // 수신번호
//            sms.put("destination", "01111111111|담당자,01111111112|홍길동"); // 수신인 %고객명% 치환
            sms.put("receiver", "01086204484"); // 수신번호
            sms.put("destination", "01086204484|바보"); // 수신인 %고객명% 치환
            sms.put("sender", "01055948861"); // 발신번호
//            sms.put("rdate", "20230912"); // 예약일자 - 20161004 : 2016-10-04일기준
//            sms.put("rtime", "1300"); // 예약시간 - 1930 : 오후 7시30분
            sms.put("testmode_yn", "Y"); // Y 인경우 실제문자 전송X , 자동취소(환불) 처리
            sms.put("title", "제목입력"); // LMS, MMS 제목 (미입력시 본문중 44Byte 또는 엔터 구분자 첫라인)

            String image = "";
            // image = "/tmp/pic_57f358af08cf7_sms_.jpg"; // MMS 이미지 파일 위치

            /******************** 전송정보 ********************/

            MultipartEntityBuilder builder = MultipartEntityBuilder.create();

            builder.setBoundary(boundary);
            builder.setMode(HttpMultipartMode.BROWSER_COMPATIBLE);
            builder.setCharset(Charset.forName(encodingType));

            for (Iterator<String> i = sms.keySet().iterator(); i.hasNext();) {
                String key = i.next();
                builder.addTextBody(key, sms.get(key), ContentType.create("Multipart/related", encodingType));
            }

            File imageFile = new File(image);
            if (image != null && image.length() > 0 && imageFile.exists()) {

                builder.addPart("image",
                        new FileBody(imageFile, ContentType.create("application/octet-stream"),
                                URLEncoder.encode(imageFile.getName(), encodingType)));
            }

            HttpEntity entity = builder.build();

            HttpClient client = HttpClients.createDefault();
            HttpPost post = new HttpPost(sms_url);
            post.setEntity(entity);

            HttpResponse res = client.execute(post);

            String result = "";
            if (res != null) {
                BufferedReader in = new BufferedReader(
                        new InputStreamReader(res.getEntity().getContent(), encodingType));
                String buffer = null;
                while ((buffer = in.readLine()) != null) {
                    result += buffer;
                }
                in.close();
            }

            System.out.println(result);

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}