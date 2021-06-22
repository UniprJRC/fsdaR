/*
 * MATLAB Compiler: 6.1 (R2015b)
 * Date: Thu Nov 23 09:56:53 2017
 * Arguments: "-B" "macro_default" "-v" "-K" "-W" 
 * "java:org.jrc.ipsc.globesec.sitaf.fsda4java,Fsda" "-T" "link:lib" "-d" 
 * "E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\fsda4java\\for_testing" 
 * "class{Fsda:E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\regression\\FSR.m,E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\regression\\FSRBeda.m,E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\regression\\FSRBmdr.m,E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\regression\\FSRbsb.m,E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\regression\\FSReda.m,E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\regression\\FSRenvmdr.m,E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\regression\\FSRmdr.m,E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\graphics\\levfwdplot.m,E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\regression\\LXS.m,E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\graphics\\mdrplot.m,E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\regression\\MMreg.m,E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\regression\\MMregcore.m,E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\regression\\MMregeda.m,E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\graphics\\resfwdplot.m,E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\graphics\\resindexplot.m,E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\regression\\Score.m,E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\regression\\Sreg.m,E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\regression\\Sregeda.m}" 
 * "-a" "E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\utilities_stat\\HApsi.m" 
 * "-a" "E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\utilities_stat\\HArho.m" 
 * "-a" "E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\utilities_stat\\HAwei.m" 
 * "-a" "E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\utilities_stat\\HYPpsi.m" 
 * "-a" "E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\utilities_stat\\HYPrho.m" 
 * "-a" "E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\utilities_stat\\HYPwei.m" 
 * "-a" "E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\utilities_stat\\OPTpsi.m" 
 * "-a" "E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\utilities_stat\\OPTrho.m" 
 * "-a" "E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\utilities_stat\\OPTwei.m" 
 * "-a" "E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\utilities_stat\\TBpsi.m" 
 * "-a" "E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\utilities_stat\\TBrho.m" 
 * "-a" "E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\utilities_stat\\TBwei.m" 
 */

package org.jrc.ipsc.globesec.sitaf.fsda4java;

import com.mathworks.toolbox.javabuilder.*;
import com.mathworks.toolbox.javabuilder.internal.*;

/**
 * <i>INTERNAL USE ONLY</i>
 */
public class Fsda4javaMCRFactory
{
   
    
    /** Component's uuid */
    private static final String sComponentId = "fsda4java_83A0DA07E33F6DFA936351B1A2EF43C1";
    
    /** Component name */
    private static final String sComponentName = "fsda4java";
    
   
    /** Pointer to default component options */
    private static final MWComponentOptions sDefaultComponentOptions = 
        new MWComponentOptions(
            MWCtfExtractLocation.EXTRACT_TO_CACHE, 
            new MWCtfClassLoaderSource(Fsda4javaMCRFactory.class)
        );
    
    
    private Fsda4javaMCRFactory()
    {
        // Never called.
    }
    
    public static MWMCR newInstance(MWComponentOptions componentOptions) throws MWException
    {
        if (null == componentOptions.getCtfSource()) {
            componentOptions = new MWComponentOptions(componentOptions);
            componentOptions.setCtfSource(sDefaultComponentOptions.getCtfSource());
        }
        return MWMCR.newInstance(
            componentOptions, 
            Fsda4javaMCRFactory.class, 
            sComponentName, 
            sComponentId,
            new int[]{9,0,0}
        );
    }
    
    public static MWMCR newInstance() throws MWException
    {
        return newInstance(sDefaultComponentOptions);
    }
}
