package hash;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class Hash {
    public static void main(String[] args) {
//        迭代器应用
        ArrayList<Integer> numbers = new ArrayList<Integer>();
        numbers.add(1);
        numbers.add(2);
        numbers.add(3);
        numbers.add(4);
        System.out.println(numbers.get(numbers.lastIndexOf(4)));
        Iterator<Integer> it = numbers.iterator();
        while (it.hasNext()) {
            Integer i = it.next();
            if (i < 3) {
                it.remove();    //删除小于3的元素
            }
        }
        System.out.println(numbers);

//java容器Hashmap遍历
        Map<String, String> map = new HashMap<String, String>();
        map.put("k1", "v1");
        map.put("k2", "v2");
        map.put("k3", "v3");
        map.put("k4", "v4");
        System.out.println(map);
        System.out.println(numbers.size()+"~||~"+ map.size());

        String key = "k4";
        String value="v1";
        boolean a= map.containsKey(key)&&map.containsValue(value);
        if (a) {

            System.out.println("Map集合中包含键名:" + key+"和Map集合中包含value名:"+value);
        } else {

            System.out.println("Map集合中没有Key值或者Value值，也有可能都没有！");

        }
        System.out.println(numbers.contains(4));
        System.out.println(map.hashCode());
        System.out.println(numbers.hashCode());
        System.out.println(map.equals(numbers));
    }
}
