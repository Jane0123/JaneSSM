package voice;

import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.Dispatch;
import com.jacob.com.Variant;

public class VoiceBroadcastUtil {
    public static void main(String[] args) {


        ActiveXComponent sap = new ActiveXComponent("Sapi.SpVoice");

        try {
// 音量 0-100
            sap.setProperty("Volume", new Variant(100));
// 语音朗读速度 -10 到 +10
            sap.setProperty("Rate", new Variant(-3));
// 获取执行对象
            Dispatch sapo = sap.getObject();
// 执行朗读，内容是传过来的字符串
            Dispatch.call(sapo, "Speak", new Variant("支付宝到账一万元"+"微信到账一万元"));
// 关闭执行对象
            sapo.safeRelease();
        } catch (Exception e) {
            e.printStackTrace();

        } finally {
// 关闭应用程序连接
            System.out.println("----------------");
            sap.safeRelease();

        }
    }
}

