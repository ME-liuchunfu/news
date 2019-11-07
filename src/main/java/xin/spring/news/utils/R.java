package xin.spring.news.utils;

import java.util.HashMap;

/**
 * 返回值实体
 */
public class R extends HashMap {

    public static final String DATA_KEY = "data";

    public static final String CODE_KEY = "code";

    public static final int CODE_200 = 200;

    public static final int CODE_500 = 500;

    public static R ok(){
        return R.ok("请求成功", CODE_200);
    }

    public static R ok(Object data){
        return R.ok(data, CODE_200);
    }

    public static R ok(Object data, int code){
        R r = new R();
        r.put(DATA_KEY, data);
        r.put(CODE_KEY, code);
        return r;
    }

    public static R error(){
        return error("请求失败，未知异常");
    }

    public static R error(String msg){
        R r = new R();
        r.put(DATA_KEY, msg);
        r.put(CODE_KEY, CODE_500);
        return r;
    }

}
