/**
 * 
 */
package org.jrc.ipsc.globesec.sitaf.fsda;

import com.mathworks.toolbox.javabuilder.MWStructArray;

/**
 * @author Emmanuele Sordini
 *
 */
public class FsdaMWStructArray {

    private MWStructArray arr;
	
	public FsdaMWStructArray(MWStructArray arr) {
		this.arr = arr; 
	} 
	
	public Object get(String fieldName, int index) {
		return arr.get(fieldName, index);
	}
	
	public Object get(Object fieldName, int index) {
		return arr.get((String)fieldName, index);
	}
	
	public String[] fieldNames() {
		return arr.fieldNames();
	}
	
	public int hasField(String fieldName, int index) {
		int result = 1;
		try {
			get(fieldName, index);
		} catch (IllegalArgumentException e) {
			result = 0;
		}
		return result;
	}
}
