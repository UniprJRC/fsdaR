/**
 * 
 */

package org.jrc.ipsc.globesec.sitaf.fsda; 

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.jrc.ipsc.globesec.sitaf.fsda4java.Fsda;

import com.mathworks.toolbox.javabuilder.MWArray;
import com.mathworks.toolbox.javabuilder.MWException;
import com.mathworks.toolbox.javabuilder.MWStructArray;

/**
 * @author Emmanuele Sordini
 *
 */
public class FsdaInterface {
    
    private static Fsda fsda;
            
//    public static OutScore Score(double[][] y, double[][] X, double lik, double[] la, double nocheck, double intercept) {
//        OutScore score = new OutScore();
//        
//        try {
//            Object[] out = fsda.R_Score(1, y, X, lik, la, nocheck, intercept);
//            MWStructArray arr = (MWStructArray) out[0];
//            
//            try {
//                double[][] sc = (double[][]) arr.get("Score", 1);
//                score.score = sc;
//            } catch (IllegalArgumentException iae) {}
//
//            try {
//                double outLik = (double) arr.get("Lik", 1);
//                score.lik = outLik;
//            } catch (IllegalArgumentException iae) {}                                    
//        } catch (MWException exc) {
//            score.error = exc.getMessage();
//        }                
//        
//        return score;
//    }
    

    @SuppressWarnings("rawtypes")
	public static Map LXS(Object...in ) {
        Map<String, Object> result = new HashMap<String, Object>();
        
        if (in.length < 2) {
            result.put("_error", "Mandatory arguments missing: y or X");
        }
        if (in.length == 2) {            
            try {
                Object o = in[0];
                if (!(o instanceof double[][])) {
                    result.put("_error", "Wrong argument format: y");
                }
                o = in[1];
                if (!(o instanceof double[][])) {
                    result.put("_error", "Wrong argument format: X");
                }                                
            } catch (Throwable e) {                
            }
        }
        
        try {
            Object[] out = null;
            
            filterHashMaps(in);
            
            out = fsda.LXS(2, in);
            
            MWStructArray arr = (MWStructArray) out[0];
            
            try {
                
            } catch (IllegalArgumentException iae) {}
            
            try {
                double[][] outrew = (double[][]) arr.get("rew", 1);
                result.put("rew", outrew[0][0]);                
            } catch (IllegalArgumentException iae) {}
            try {
                double[][] beta = (double[][]) arr.get("beta", 1);
                result.put("beta", beta);
            } catch (IllegalArgumentException iae) {}
            try {
                Object bs = arr.get("bs", 1);
                if (bs instanceof byte[][]) {
                    bs = (byte[][]) bs;
                } else if (bs instanceof short[][]) {
                    bs = (short[][]) bs;
                } else if (bs instanceof int[][]) {
                    bs = (int[][]) bs;
                } else if (bs instanceof long[][]) {
                    bs = (long[][]) bs;
                } 
                
                result.put("bs", bs);     
            } catch (IllegalArgumentException iae) {}
            try {
                double[][] residuals = (double[][]) arr.get("residuals", 1);
                result.put("residuals", residuals);                
            } catch (IllegalArgumentException iae) {}
            try {
                double[][] scale = (double[][]) arr.get("scale", 1);
                result.put("scale", scale);
            } catch (IllegalArgumentException iae) {}
            try {
                double[][] weights = (double[][]) arr.get("weights", 1);
                result.put("weights", weights);                                                
            } catch (IllegalArgumentException iae) {}
            try {
                double[][] outh = (double[][]) arr.get("h", 1);
                result.put("h", outh[0][0]);                
            } catch (IllegalArgumentException iae) {}
            try {
                double[][] outliers = (double[][]) arr.get("outliers", 1);
                result.put("outliers", outliers);                                                                
            } catch (IllegalArgumentException iae) {}
            try {
                double[][] outconflev = (double[][]) arr.get("conflev", 1);
                result.put("conflev", outconflev[0][0]);
            } catch (IllegalArgumentException iae) {}
            try {
                double[][] singsub = (double[][]) arr.get("singsub", 1);
                result.put("singsub", singsub[0][0]);                
            } catch (IllegalArgumentException iae) {}
            try {
                char[][] clazz = (char[][]) arr.get("class", 1);
                result.put("class", new String(clazz[0]));
            } catch (IllegalArgumentException iae) {}
            try {
                double[][] outy = (double[][]) arr.get("y", 1);
                result.put("y", outy);                
            } catch (IllegalArgumentException iae) {}
            try {
                double[][] outX = (double[][]) arr.get("X", 1);
                result.put("X", outX);
            } catch (IllegalArgumentException iae) {}
            try {
                double[][] C = (double[][]) arr.get("C", 1);
                result.put("C", C);
            } catch (IllegalArgumentException iae) {}

            MWArray.disposeArray(arr);
        } catch (MWException exc) {
            result.put("_error", exc.getMessage());
        }        
        
        return result;
    }

    @SuppressWarnings("rawtypes")
	public static Map FSR(Object...in ) {
        Map<String, Object> result = new HashMap<String, Object>();
        
        if (in.length < 2) {
            result.put("_error", "Mandatory arguments missing: y or X");
        }
        if (in.length == 2) {            
            try {
                Object o = in[0];
                if (!(o instanceof double[][])) {
                    result.put("_error", "Wrong argument format: y");
                }
                o = in[1];
                if (!(o instanceof double[][])) {
                    result.put("_error", "Wrong argument format: X");
                }                                
            } catch (Throwable e) {                
            }
        }
        
        try {
            Object[] out = null;
            
            filterHashMaps(in);
            
            out = fsda.FSR(1, in);
            
            MWStructArray arr = (MWStructArray) out[0];
            
            try {
                
            } catch (IllegalArgumentException iae) {}
            
            try {
                double[][] listout = (double[][]) arr.get("ListOut", 1);
                result.put("ListOut", listout);                
            } catch (IllegalArgumentException iae) {}
            try {
                double[][] beta = (double[][]) arr.get("beta", 1);
                result.put("beta", beta);
            } catch (IllegalArgumentException iae) {}
            try {
                double[][] mdr = (double[][]) arr.get("mdr", 1);
                result.put("mdr", mdr);                
            } catch (IllegalArgumentException iae) {}
            try {
                double[][] un = (double[][]) arr.get("Un", 1);
                result.put("Un", un);
            } catch (IllegalArgumentException iae) {}
            try {
                double[][] nout = (double[][]) arr.get("nout", 1);
                result.put("nout", nout);                                                
            } catch (IllegalArgumentException iae) {}
            try {
                double[][] constr = (double[][]) arr.get("constr", 1);
                result.put("constr", constr);                
            } catch (IllegalArgumentException iae) {}

            MWArray.disposeArray(arr);
        } catch (MWException exc) {
            result.put("_error", exc.getMessage());
        }        
        
        return result;
    }
    
    
    @SuppressWarnings({ "rawtypes" })
	private static Object[] filterHashMaps(Object[] in) {
    	for (int i=0; i<in.length; i++) {
    		if (in[i] instanceof java.util.HashMap) {
    			MWStructArray record = hashMap2Struct((java.util.HashMap)in[i]);
    			in[i] = record;
    		}
    	}
    	return in;
    }
    
    @SuppressWarnings({ "rawtypes", "unchecked" })
	private static MWStructArray hashMap2Struct(HashMap map) {
    	Set<String> keys = (Set<String>) map.keySet(); 
    	MWStructArray struct = new MWStructArray(1, 1, keys.toArray(new String[0]));
    	for (String field: keys) {
    		struct.set(field, 1, map.get(field));
    	}
    	
    	return struct;
    }
    
/*    public void pippo(double[][] x) {
        for (int i=0; i<x.length;i++) {
            for (int j=0; j<x[i].length; j++) {
                System.out.println(x[i][j]);
            }
        }
    }
	
    public void score2(double[][] y, double[][] X, double lik, double[] la, double nocheck, double intercept) {
        OutScore score = Score(y, X, lik, la, nocheck, intercept);
        pippo(score.score);
    }*/
    
    static {
        try {
            fsda = new Fsda();
        } catch (MWException e) {
            
        }
    }
}
