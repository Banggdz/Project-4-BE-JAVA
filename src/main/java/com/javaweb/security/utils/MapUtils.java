package com.javaweb.security.utils;

public class MapUtils {
    public static <T> T getObject(Object obj, Class<T> tClass){
        if(obj != null){
            if(tClass.getTypeName().equals("java.lang.Long")){
                obj = obj != "" ? Long.parseLong(obj.toString()) : null;
            }
            else if(tClass.getTypeName().equals("java.lang.String")){
                obj = obj != "" ? obj.toString() : null;
            }
            else if(tClass.getTypeName().equals("java.lang.Integer")){
                obj = obj != "" ? Integer.parseInt(obj.toString()) : null;
            }

        }
        return tClass.cast(obj);
    }
}
