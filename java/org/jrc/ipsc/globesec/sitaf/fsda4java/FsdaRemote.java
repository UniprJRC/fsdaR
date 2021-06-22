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

import com.mathworks.toolbox.javabuilder.pooling.Poolable;
import java.util.List;
import java.rmi.Remote;
import java.rmi.RemoteException;

/**
 * The <code>FsdaRemote</code> class provides a Java RMI-compliant interface to the 
 * M-functions from the files:
 * <pre>
 *  E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\regression\\FSR.m
 *  E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\regression\\FSRBeda.m
 *  E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\regression\\FSRBmdr.m
 *  E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\regression\\FSRbsb.m
 *  E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\regression\\FSReda.m
 *  E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\regression\\FSRenvmdr.m
 *  E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\regression\\FSRmdr.m
 *  E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\graphics\\levfwdplot.m
 *  E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\regression\\LXS.m
 *  E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\graphics\\mdrplot.m
 *  E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\regression\\MMreg.m
 *  E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\regression\\MMregcore.m
 *  E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\regression\\MMregeda.m
 *  E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\graphics\\resfwdplot.m
 *  E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\graphics\\resindexplot.m
 *  E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\regression\\Score.m
 *  E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\regression\\Sreg.m
 *  E:\\Projects\\R\\fsdaR-proj\\fsdaR-MATLAB\\FSDA-src\\regression\\Sregeda.m
 * </pre>
 * The {@link #dispose} method <b>must</b> be called on a <code>FsdaRemote</code> 
 * instance when it is no longer needed to ensure that native resources allocated by this 
 * class are properly freed, and the server-side proxy is unexported.  (Failure to call 
 * dispose may result in server-side threads not being properly shut down, which often 
 * appears as a hang.)  
 *
 * This interface is designed to be used together with 
 * <code>com.mathworks.toolbox.javabuilder.remoting.RemoteProxy</code> to automatically 
 * generate RMI server proxy objects for instances of 
 * org.jrc.ipsc.globesec.sitaf.fsda4java.Fsda.
 */
public interface FsdaRemote extends Poolable
{
    /**
     * Provides the standard interface for calling the <code>FSR</code> M-function with 3 
     * input arguments.  
     *
     * Input arguments to standard interface methods may be passed as sub-classes of 
     * <code>com.mathworks.toolbox.javabuilder.MWArray</code>, or as arrays of any 
     * supported Java type (i.e. scalars and multidimensional arrays of any numeric, 
     * boolean, or character type, or String). Arguments passed as Java types are 
     * converted to MATLAB arrays according to default conversion rules.
     *
     * All inputs to this method must implement either Serializable (pass-by-value) or 
     * Remote (pass-by-reference) as per the RMI specification.
     *
     * M-documentation as provided by the author of the M function:
     * <pre>
     * %FSR gives an automatic outlier detection procedure in linear regression
     * %
     * %<a href="matlab: docsearchFS('FSR')">Link to the help function</a>
     * %
     * % Required input arguments:
     * %
     * %    y:         Response variable. Vector. Response variable, specified as
     * %               a vector of length n, where n is the number of
     * %               observations. Each entry in y is the response for the
     * %               corresponding row of X.
     * %               Missing values (NaN's) and infinite values (Inf's) are
     * %               allowed, since observations (rows) with missing or infinite
     * %               values will automatically be excluded from the
     * %               computations.
     * %  X :          Predictor variables. Matrix. Matrix of explanatory
     * %               variables (also called 'regressors') of dimension n x (p-1)
     * %               where p denotes the number of explanatory variables
     * %               including the intercept.
     * %               Rows of X represent observations, and columns represent
     * %               variables. By default, there is a constant term in the
     * %               model, unless you explicitly remove it using input option
     * %               intercept, so do not include a column of 1s in X. Missing
     * %               values (NaN's) and infinite values (Inf's) are allowed,
     * %               since observations (rows) with missing or infinite values
     * %               will automatically be excluded from the computations.
     * %
     * % Optional input arguments:
     * %
     * %  intercept :  Indicator for constant term. Scalar. If 1, a model with
     * %               constant term will be fitted (default), else no constant
     * %               term will be included.
     * %               Example - 'intercept',1 
     * %               Data Types - double
     * %           h   : The number of observations that have determined the least
     * %                 trimmed squares estimator. Scalar. h is an integer
     * %                 greater or equal than p but smaller then n. Generally if
     * %                 the purpose is outlier detection h=[0.5*(n+p+1)] (default
     * %                 value). h can be smaller than this threshold if the
     * %                 purpose is to find subgroups of homogeneous observations.
     * %                 In this function the LTS/LMS estimator is used just to
     * %                 initialize the search.
     * %                 Example - 'h',round(n*0,75) 
     * %                 Data Types - double
     * %       nsamp   : Number of subsamples which will be extracted to find the
     * %                 robust estimator. Scalar. If nsamp=0 all subsets will be 
     * extracted.
     * %                 They will be (n choose p).
     * %                 If the number of all possible subset is <1000 the
     * %                 default is to extract all subsets otherwise just 1000.
     * %                 Example - 'nsamp',1000 
     * %                 Data Types - double
     * %       lms     : Criterion to use to find the initial
     * %                 subset to initialize the search. Scalar,  vector or structure.
     * %                 lms specifies the criterion to use to find the initial
     * %                 subset to initialize the search (LMS, LTS with
     * %                 concentration steps, LTS without concentration steps
     * %                 or subset supplied directly by the user).
     * %                 The default value is 1 (Least Median of Squares
     * %                 is computed to initialize the search). On the other hand,
     * %                 if the user wants to initialze the search with LTS with
     * %                 all the default options for concentration steps then
     * %                 lms=2. If the user wants to use LTS without
     * %                 concentration steps, lms can be a scalar different from 1
     * %                 or 2. If lms is a struct it is possible to control a
     * %                 series of options for concentration steps (for more
     * %                 details see option lms inside LXS.m)
     * %                 LXS.m.
     * %                 If, on the other hand, the user wants to initialize the
     * %                 search with a prespecified set of units there are two
     * %                 possibilities: 
     * %                 1) lms can be a vector with length greater than 1 which
     * %                 contains the list of units forming the initial subset. For 
     * %                 example, if the user wants to initialize the search
     * %                 with units 4, 6 and 10 then lms=[4 6 10]; 
     * %                 2) lms is a struct which contains a field named bsb which
     * %                 contains the list of units to initialize the search. For
     * %                 example, in the case of simple regression through the
     * %                 origin with just one explanatory variable, if the user
     * %                 wants to initialize the search with unit 3 then
     * %                 lms=struct; lms.bsb=3;
     * %                 Example - 'lms',1 
     * %                 Data Types - double
     * %       plots   : Plot on the screen. Scalar. 
     * %                 If plots=1 (default) the plot of minimum deletion
     * %                 residual with envelopes based on n observations and the
     * %                 scatterplot matrix with the outliers highlighted is
     * %                 produced.
     * %                 If plots=2 the user can also monitor the intermediate
     * %                 plots based on envelope superimposition.
     * %                 Else no plot is produced.
     * %                 Example - 'plots',1 
     * %                 Data Types - double
     * %       init    : Search initialization. Scalar. It specifies the initial subset 
     * size to start
     * %                 monitoring exceedances of minimum deletion residual, if
     * %                 init is not specified it set equal to:
     * %                   p+1, if the sample size is smaller than 40;
     * %                   min(3*p+1,floor(0.5*(n+p+1))), otherwise.
     * %               Example - 'init',100 starts monitoring from step m=100 
     * %               Data Types - double
     * %       nocheck : Check input arguments. Scalar. If nocheck is equal to 1 no check 
     * is performed on
     * %                 matrix y and matrix X. Notice that y and X are left
     * %                 unchanged. In other words the additional column of ones
     * %                 for the intercept is not added. As default nocheck=0.
     * %               Example - 'nocheck',1 
     * %               Data Types - double
     * %    bivarfit : Superimpose bivariate least square lines. Character. This option 
     * adds
     * %                 one or more least squares lines, based on
     * %                 SIMPLE REGRESSION of y on Xi, to the plots of y|Xi.
     * %                 bivarfit = ''
     * %                   is the default: no line is fitted.
     * %                 bivarfit = '1'
     * %                   fits a single ols line to all points of each bivariate
     * %                   plot in the scatter matrix y|X.
     * %                 bivarfit = '2'
     * %                   fits two ols lines: one to all points and another to
     * %                   the group of the genuine observations. The group of the
     * %                   potential outliers is not fitted.
     * %                 bivarfit = '0'
     * %                   fits one ols line to each group. This is useful for the
     * %                   purpose of fitting mixtures of regression lines.
     * %                 bivarfit = 'i1' or 'i2' or 'i3' etc. fits 
     * %                   an ols line to a specific group, the one with
     * %                   index 'i' equal to 1, 2, 3 etc. Again, useful in case
     * %                   of mixtures.
     * %               Example - 'bivarfit','2' 
     * %               Data Types - char
     * %       multivarfit : Superimpose multivariate least square lines. Character.
     * %                 This option adds one or more least square lines, based on
     * %                 MULTIVARIATE REGRESSION of y on X, to the plots of y|Xi.
     * %                 multivarfit = ''
     * %                   is the default: no line is fitted.
     * %                 multivarfit = '1'
     * %                   fits a single ols line to all points of each bivariate
     * %                   plot in the scatter matrix y|X. The line added to the
     * %                   scatter plot y|Xi is avconst + Ci*Xi, where Ci is the
     * %                   coefficient of Xi in the multivariate regression and
     * %                   avconst is the effect of all the other explanatory
     * %                   variables different from Xi evaluated at their centroid
     * %                   (that is overline{y}'C))
     * %                 multivarfit = '2'
     * %                   equal to multivarfit ='1' but this time we also add the
     * %                   line based on the group of unselected observations
     * %                   (i.e. the normal units).
     * %               Example - 'multivarfit','1' 
     * %               Data Types - char
     * %      labeladd : Add outlier labels in plot. Character. If this option is
     * %                 '1',  we label the outliers with the
     * %                 unit row index in matrices X and y. The default value is
     * %                 labeladd='', i.e. no label is added.
     * %               Example - 'labeladd','1' 
     * %               Data Types - char
     * %       nameX  : Add variable labels in plot. Cell array of strings. Cell
     * %                 array of strings of length p containing the labels of
     * %                 the variables of the regression dataset. If it is empty
     * %                 (default) the sequence X1, ..., Xp will be created
     * %                 automatically
     * %               Example - 'nameX',{'NameVar1','NameVar2'} 
     * %               Data Types - cell
     * %       namey  :  Add response label. Character. String containing the
     * %                 label of the response
     * %               Example - 'namey','NameOfResponse' 
     * %               Data Types - char
     * %       ylim   :  Control y scale in plot. Vector. Vector with two elements 
     * controlling minimum and maximum
     * %                 on the y axis. Default value is '' (automatic scale)
     * %               Example - 'ylim',[0,10] sets the minimum value to 0 and the
     * %               max to 10 on the y axis
     * %               Data Types - double
     * %       xlim   : Control x scale in plot. Vector. Vector with two elements
     * %               minimum and maximum on the x axis. Default value is ''
     * %               (automatic scale)
     * %               Example - 'xlim',[0,10] sets the minimum value to 0 and the
     * %               max to 10 on the x axis
     * %               Data Types - double
     * %      bonflev  : Signal to use to identify outliers. Scalar. Option to be
     * %                used if the distribution of the data is
     * %                 strongly non normal and, thus, the general signal
     * %                 detection rule based on consecutive exceedances cannot be
     * %                 used. In this case bonflev can be:
     * %                 - a scalar smaller than 1 which specifies the confidence
     * %                   level for a signal and a stopping rule based on the
     * %                   comparison of the minimum MD with a
     * %                   Bonferroni bound. For example if bonflev=0.99 the
     * %                   procedure stops when the trajectory exceeds for the
     * %                   first time the 99% bonferroni bound.
     * %                 - A scalar value greater than 1. In this case the
     * %                   procedure stops when the residual trajectory exceeds
     * %                   for the first time this value.
     * %                 Default value is '', which means to rely on general rules
     * %                 based on consecutive exceedances.
     * %               Example - 'bonflev',0.99
     * %               Data Types - double
     * %       msg    :  Level of output to display. Scalar. It controls whether
     * %                 to display or not messages on the screen
     * %                 If msg==1 (default) messages are displayed on the screen about
     * %                   step in which signal took place
     * %                 else no message is displayed on the screen.
     * %               Example - 'msg',1 
     * %               Data Types - double
     * % bsbmfullrank : Dealing with singluar X matrix. Scalar. This option tells
     * %                 how to behave in case subset at step m
     * %                 (say bsbm) produces a singular X. In other words,
     * %                 this options controls what to do when rank(X(bsbm,:)) is
     * %                 smaller then number of explanatory variables. If
     * %                 bsbmfullrank =1 (default) these units (whose number is
     * %                 say mnofullrank) are constrained to enter the search in
     * %                 the final n-mnofullrank steps else the search continues
     * %                 using as estimate of beta at step m the estimate of beta
     * %                 found in the previous step.
     * %               Example - 'bsbmfullrank',1 
     * %               Data Types - double
     * %
     * %
     * % Output:
     * %
     * %         out:   structure which contains the following fields
     * %
     * % out.ListOut  = k x 1 vector containing the list of the units declared as
     * %                outliers or NaN if the sample is homogeneous
     * % out.outliers = out.ListOut. This field is added for homogeneity with the
     * %                other robust estimators.  
     * % out.beta   =  p-by-1 vector containing the estimated regression
     * %               parameters (in step n-k).
     * % out.scale  =  scalar containing the estimate of the scale (sigma). 
     * %
     * % out.residuals= n x 1 vector containing the estimates of the robust
     * %                scaled residuals.
     * % out.fittedvalues= n x 1 vector containing the fitted values.
     * % out.mdr    =  (n-init) x 2 matrix
     * %               1st col = fwd search index
     * %               2nd col = value of minimum deletion residual in each step
     * %               of the fwd search
     * % out.Un     =  (n-init) x 11 matrix which contains the unit(s) included
     * %               in the subset at each step of the fwd search.
     * %               REMARK: in every step the new subset is compared with the
     * %               old subset. Un contains the unit(s) present in the new
     * %               subset but not in the old one.
     * %               Un(1,2) for example contains the unit included in step
     * %               init+1.
     * %               Un(end,2) contains the units included in the final step
     * %               of the search.
     * % out.nout    = 2 x 5 matrix containing the number of times mdr went out
     * %               of particular quantiles.
     * %               First row contains quantiles 1 99 99.9 99.99 99.999.
     * %               Second row contains the frequency distribution.
     * % out.constr  = This output is produced only if the search found at a
     * %               certain step X is a singular matrix. In this case the
     * %               search runs in a constrained mode, that is including the
     * %               units which produced a non singular matrix in the last n-constr
     * %               steps. out.constr is a vector which contains the list of
     * %               units which produced a singular X matrix
     * % out.class  =  'FSR'.
     * %
     * % See also: FSReda, LXS.m
     * %
     * % References:
     * %
     * %       Riani, M., Atkinson A.C., Cerioli A. (2009). Finding an unknown
     * %       number of multivariate outliers. Journal of the Royal Statistical
     * %       Society Series B, Vol. 71, pp. 201-221.
     * %
     * % Copyright 2008-2016.
     * % Written by FSDA team
     * %
     * %
     * %
     * %<a href="matlab: docsearchFS('FSR')">Link to the help page for this function</a>
     * % Last modified 31-05-2016
     * </pre>
     *
     * @param nargout Number of outputs to return.
     * @param rhs The inputs to the M function.
     *
     * @return Array of length nargout containing the function outputs. Outputs are 
     * returned as sub-classes of <code>com.mathworks.toolbox.javabuilder.MWArray</code>. 
     * Each output array should be freed by calling its <code>dispose()</code> method.
     *
     * @throws java.jmi.RemoteException An error has occurred during the function call or 
     * in communication with the server.
     */
    public Object[] FSR(int nargout, Object... rhs) throws RemoteException;
    /**
     * Provides the standard interface for calling the <code>FSRBeda</code> M-function 
     * with 3 input arguments.  
     *
     * Input arguments to standard interface methods may be passed as sub-classes of 
     * <code>com.mathworks.toolbox.javabuilder.MWArray</code>, or as arrays of any 
     * supported Java type (i.e. scalars and multidimensional arrays of any numeric, 
     * boolean, or character type, or String). Arguments passed as Java types are 
     * converted to MATLAB arrays according to default conversion rules.
     *
     * All inputs to this method must implement either Serializable (pass-by-value) or 
     * Remote (pass-by-reference) as per the RMI specification.
     *
     * M-documentation as provided by the author of the M function:
     * <pre>
     * %FSRBeda enables to monitor several quantities in each step of the Bayesian search
     * %
     * %<a href="matlab: docsearchFS('FSRBeda')">Link to the help function</a>
     * %
     * % Required input arguments:
     * %
     * %   y:          A vector with n elements that contains the response variables.
     * %               Missing values (NaN's) and infinite values (Inf's) are
     * %               allowed, since observations (rows) with missing or infinite
     * %               values will automatically be excluded from the
     * %               computations.
     * %   X :         Data matrix of explanatory variables (also called 'regressors')
     * %               of dimension (n x p-1). Rows of X represent observations, and
     * %               columns represent variables. Missing values (NaN's) and
     * %               infinite values (Inf's) are allowed, since observations
     * %               (rows) with missing or infinite values will automatically
     * %               be excluded from the computations.
     * %               PRIOR INFORMATION
     * %               $\\beta$ is assumed to have a normal distribution with
     * %               mean $\\beta_0$ and (conditional on $\\tau_0$) covariance
     * %               $(1/\\tau_0) (X_0'X_0)^{-1}$.
     * %               $\\beta \\sim N(    \\beta_0, (1/\\tau_0) (X_0'X_0)^{-1}    )$
     * %
     * %
     * % Optional input arguments:
     * %
     * %   intercept :  Indicator for constant term. Scalar.
     * %                     If 1, a model with constant term will be fitted (default),
     * %                      else no constant term will be included.
     * %               Example - 'intercept',1 
     * %               Data Types - double
     * %    bayes    : It specifies prior information. Structure.
     * %               A structure which specifies prior information.
     * %               If structure bayes is not supplied the default values which
     * %               are used are: beta0= zeros(p,1) (vector of zeros); R=eye(p) 
     * %               (Identity matrix); tau0=1/1e+6 (very large value for the
     * %               prior variance, that is a very small value for tau0); n0=1 
     * %               (just one prior observation). 
     * %               Strucure bayes contains the following fields:
     * %               bayes.beta0 =  p-times-1 vector containing prior mean of $\\beta$
     * %               bayes.R  =     p-times-p positive definite matrix which can be
     * %                              interepreted as $X_0'X_0$ where $X_0$ is a n0 x p 
     * matrix
     * %                              coming from previous experiments (assuming that the
     * %                              intercept is included in the model)
     * %               bayes.tau0 =   scalar. Prior estimate of $\\tau=1/ 
     * \\sigma^2=a_0/b_0$. 
     * %                              The prior distribution of tau0 is a gamma 
     * distribution with
     * %                              parameters a and b, that is
     * %                              $p(\\tau_0) \\propto \\tau^{a_0-1} \\exp (-b_0
     * %                              \\tau)$; 
     * %                              $E(\\tau_0)= a_0/b_0$.
     * %               bayes.n0 = scalar. Sometimes it helps to think of the prior
     * %                      information as coming from n0 previous experiments.
     * %                      Therefore we assume that matrix $X_0$ (which defines
     * %                      R), was made up of n0 observations.
     * %                  Example - 
     * bayes=struct;bayes.R=R;bayes.n0=n0;bayes.beta0=beta0;bayes.tau0=tau0;
     * %                  Data Types - double
     * %       bsb   : list of units forming the initial subset. Vector.
     * %                if bsb=0 then the procedure starts with p
     * %               units randomly chosen else if bsb is not 0 the search will
     * %               start with m0=length(bsb). The default value of bsb is ''
     * %               that is in the first step just prior information is used.
     * %               Example - bsb=[2 5 1];
     * %               Data Types - double
     * %        init : Search initialization. Scalar. 
     * %               scalar, specifies the point where to start monitoring
     * %               required diagnostics. if init is not specified it will be
     * %               set equal to :
     * %                 p+1, if the sample size is smaller than 40;
     * %                 min(3*p+1,floor(0.5*(n+p+1))), otherwise.
     * %                   Example - 'init',100 starts monitoring from step m=100 
     * %                   Data Types - double
     * %      nocheck: Check input arguments. Scalar.
     * %               Scalar. If nocheck is equal to 1 no check is performed on
     * %               matrix y and matrix X. Notice that y and X are left
     * %               unchanged. In other words the additional column of ones for
     * %               the intercept is not added. As default nocheck=0. See
     * %               routine chkinputRB.m for the details of the operations.
     * %               Example - 'nocheck',1 
     * %               Data Types - double
     * %  conflev:   confidence levels to be used to compute HPDI. Vector.
     * %               This input option is used just if input
     * %               stats=1. The default value of conflev is [0.95 0.99] that
     * %               is 95% and 99% HPDI confidence intervals are computed.
     * %               Example - 'conflev',[0.90 0.93] 
     * %               Data Types - double
     * % Remark:       The user should only give the input arguments that have to
     * %               change their default value. The name of the input arguments
     * %               needs to be followed by their value. The order of the input
     * %               arguments is of no importance.
     * %
     * %               Missing values (NaN's) and infinite values (Inf's) are allowed,
     * %               since observations (rows) with missing or infinite values
     * %               will automatically be excluded from the computations. y can
     * %               be both a row of column vector.
     * %
     * % Output:
     * %
     * %   The output consists of a structure 'out' containing the following
     * %   fields:
     * %   out.RES=    Scaled residuals. Matrix.
     * %               n x (n-init+1) matrix containing the monitoring of
     * %               scaled residuals. 
     * %               1st row = residual for first unit; 
     * %               ...; 
     * %               nth row = residual for nth unit.
     * %   out.LEV=    Leverage. Matrix.
     * %               (n+1) x (n-init+1) = matrix containing the monitoring of
     * %               leverage. 
     * %               1st row = leverage for first unit;
     * %               ...; 
     * %               nth row = leverage for nth unit.
     * %    out.BB=    n x (n-init+1) matrix containing the information about the units 
     * belonging
     * %               to the subset at each step of the forward search. 
     * %               1st col = indexes of the units forming subset in the
     * %               initial step; 
     * %               ...; 
     * %               last column = units forming subset in the final step (all
     * %               units).
     * %   out.mdrB=     n-init x 3 matrix which contains the monitoring of Bayesian
     * %               minimum deletion residual or (m+1)ordered residual  at each
     * %               step of the forward search. 
     * %               1st col = fwd search index (from init to n-1); 
     * %               2nd col = minimum deletion residual; 
     * %               3rd col = (m+1)-ordered residual. 
     * %               Remark: these quantities are stored with sign, that is the
     * %               min deletion residual is stored with negative sign if
     * %               it corresponds to a negative residual.
     * %   out.msrB=       n-init+1 x 3 = matrix which contains the monitoring of
     * %               maximum studentized residual or m-th ordered residual. 
     * %               1st col = fwd search index (from init to n); 
     * %               2nd col = maximum studentized residual; 
     * %               3rd col = (m)-ordered studentized residual. 
     * %   out.Coo=        (n-init+1) x 2 matrix containing the monitoring of Cook or
     * %               modified Cook distance in each step of the forward search. 
     * %               1st col = fwd search index (from init to n); 
     * %               2nd col = monitoring of Cook distance. 
     * %  out.beta1 =  (n-init+1) x (p+1) matrix containing the monitoring of
     * %               posterior mean of $\\beta$ (regression coefficents)
     * %               $\\beta_1 = (c*R + X'X)^{-1} (c*R*\\beta_0 + X'y)$
     * %    out.Gam    =  (n-init+1) x 3 matrix containing: 
     * %               1st col = fwd search index (from init to n); 
     * %               2nd col = shape parameter $a_1$ of the posterior gamma
     * %               distribution of tau; 
     * %               3rd col = scale parameter $b_1$ of the posterior gamma
     * %               distribution of tau. 
     * %               Remark: $a_1 = 0.5 (c*n0 + m)$ where m is subset size; 
     * %                       $b_1 = 0.5 * ( n0 / \\tau_0 + (y-X*\\beta_1)'y 
     * +(\\beta_0-\\beta_1)'*c*R*\\beta_0 )$
     * %  out.covbeta1=    p x p x (n-init+1) 3D array containing posterior covariance 
     * matrix
     * %               (conditional on $tau_1$) of $\\beta$. 
     * %               $cov(\\beta_1) = (1/tau_1) * (c*R + X'X)^{-1}$; 
     * %               where $tau_1$ is defined as $a_1/b_1$ (that is through the gamma
     * %               parameters of the posterior distribution of $\\tau$).
     * %               The posterior distribution of $\\tau$ is a gamma distribution
     * %               with parameters $a_1$ and $b_1$.
     * %    out.S21=   (n-init+1) x 3 matrix containing the monitoring of
     * %               posterior estimate of $\\sigma^2$ and $\\tau$  
     * %               in each step of the forward search. 
     * %               1st col = fwd search index (from init to n); 
     * %               2nd col = monitoring of $\\sigma^2_1$ (posterior estimate of
     * %               $\\sigma^2$); 
     * %               3rd col = monitoring $\\tau_1$ (posterior estimate of
     * %               $\\tau$).
     * %     out.Bpval =   (n-init+1) x (p+1) containing Bayesian p-values.
     * %               p-value = $P(|t| > | \\hat{\\beta} / se(beta) |)$
     * %               = prob. of beta different from 0. 
     * %               1st col = fwd search index (from init to n); 
     * %               2nd col = p-value for first variable; 
     * %               ...; 
     * %               (p+1) col = p-value for p-th variable.
     * %out.beta1HPD   =  (n-init+1)-by-2-by-p 3D array.
     * %               Bhpd(:,:,1) = lower and upper HPDI of first element of
     * %               $\\beta_1$ (posterior estimate of $\\beta$); 
     * %               ...; 
     * %               Bhpd(:,:,p) = lower and upper HPDI of  last element
     * %               of $\\beta_1$  (posterior estimate of $\\beta$). 
     * %   out.tau1HPD =  (n-init+1) x 3 containing HPDI for $\\tau_1$. 
     * %               1st col = fwd search index (from init to n); 
     * %               2nd col = lower value of HPDI; 
     * %               3rd col = upper value of HPDI;  
     * % out.sigma21HPD =  (n-init+1) x 3 containing HPDI for $\\sigma^2_1$. 
     * %               1st col = fwd search index (from init to n); 
     * %               2nd col = lower value of HPDI; 
     * %               3rd col = upper value of HPDI. 
     * %  out.postodds =   (n-init+1)-by-(p+1) matrix which contains posterior odds for 
     * $\\beta_j=0$. 
     * %               For example the posterior odd of $\\beta_0=0$ is p(y| model which 
     * contains
     * %               all expl variables except the one associated with beta0) divided by
     * %               p(y| model which contains all expl variables). 
     * %               1st col = fwd search index (from init to n); 
     * %               2nd col = posterior odd for $beta_1$; 
     * %               ...; 
     * %               (p+1) col = posterior odd for $beta_p$. 
     * % out.modelprob =  (n-init+1)-by-(p+1) matrix which contains
     * %               posterior model probability of the model which excludes
     * %               variable j. For example if modelprob(j)= 0.28, that is if
     * %               the probability of the model which does not contain
     * %               variable j is equal to 0.28, it means that there is a 28%
     * %               chance that beta_j=0 and a 72% chance that it is not. 
     * %               1st col = fwd search index (from init to n); 
     * %               2nd col = posterior model prob of the model which excludes
     * %               $\\beta_1$; 
     * %               ...; 
     * %               (p+1) col = posterior model prob of the model which
     * %               excludes $beta_p$. 
     * %    out.Un=        (n-init) x 11 matrix which contains the unit(s)
     * %               included in the subset at each step of the fwd search. 
     * %               REMARK: in every step the new subset is compared with the
     * %               old subset. Un contains the unit(s) present in the new
     * %               subset but not in the old one Un(1,2) for example contains
     * %               the unit included in step init+1 Un(end,2) contains the
     * %               units included in the final step of the search.
     * %     out.y=        A vector with n elements that contains the response
     * %               variable which has been used.
     * %     out.X=       Data matrix of explanatory variables
     * %               which has been used (it also contains the column of ones if
     * %               input option intercept was missing or equal to 1).
     * %out.class =    'FSRBeda'.
     * %
     * %
     * % See also FSRB, regressB, FSRBmdr
     * %
     * % References:
     * %
     * %   Atkinson A.C., Corbellini A. and Riani M. (2017), Robust Bayesian
     * %   Regression, Test, in press.
     * %
     * %
     * % Copyright 2008-2016.
     * % Written by FSDA team
     * %
     * %
     * %<a href="matlab: docsearchFS('FSRBeda')">Link to the help function</a>
     * % Last modified 14-06-2016
     * </pre>
     *
     * @param nargout Number of outputs to return.
     * @param rhs The inputs to the M function.
     *
     * @return Array of length nargout containing the function outputs. Outputs are 
     * returned as sub-classes of <code>com.mathworks.toolbox.javabuilder.MWArray</code>. 
     * Each output array should be freed by calling its <code>dispose()</code> method.
     *
     * @throws java.jmi.RemoteException An error has occurred during the function call or 
     * in communication with the server.
     */
    public Object[] FSRBeda(int nargout, Object... rhs) throws RemoteException;
    /**
     * Provides the standard interface for calling the <code>FSRBmdr</code> M-function 
     * with 7 input arguments.  
     *
     * Input arguments to standard interface methods may be passed as sub-classes of 
     * <code>com.mathworks.toolbox.javabuilder.MWArray</code>, or as arrays of any 
     * supported Java type (i.e. scalars and multidimensional arrays of any numeric, 
     * boolean, or character type, or String). Arguments passed as Java types are 
     * converted to MATLAB arrays according to default conversion rules.
     *
     * All inputs to this method must implement either Serializable (pass-by-value) or 
     * Remote (pass-by-reference) as per the RMI specification.
     *
     * M-documentation as provided by the author of the M function:
     * <pre>
     * %FSRBmdr computes minimum deletion residual and other basic linear regression 
     * quantities in each step of the Bayesian search.
     * %
     * %
     * %<a href="matlab: docsearchFS('FSRBmdr')">Link to the help function</a>
     * %
     * % Required input arguments:
     * %
     * %  y:           Response variable. Vector.  A vector with n elements that contains 
     * the response variable.
     * %               Missing values (NaN's) and infinite values (Inf's) are
     * %               allowed, since observations (rows) with missing or infinite
     * %               values will automatically be excluded from the
     * %               computations.
     * %  X :          Predictor variables. Matrix.  Data matrix of explanatory
     * %               variables (also called
     * %               'regressors') of dimension (n x p-1).
     * %               Rows of X represent observations, and columns represent
     * %               variables. Missing values (NaN's) and infinite values
     * %               (Inf's) are allowed, since observations (rows) with missing
     * %               or infinite values will automatically be excluded from the
     * %               computations.
     * %
     * %
     * %               PRIOR INFORMATION
     * %               $\\beta$ is assumed to have a normal distribution with
     * %               mean $\\beta_0$ and (conditional on $\\tau_0$) covariance
     * %               $(1/\\tau_0) (X_0'X_0)^{-1}$.
     * %               $\\beta \\sim N(    \\beta_0, (1/\\tau_0) (X_0'X_0)^{-1}    )$
     * %
     * %   beta0 :     Prior mean of $\\beta$. p-times-1 vector.
     * %    R    :     Matrix associated with covariance matrix of $\\beta$. p-times-p
     * %               positive definite matrix.
     * %               It can be interpreted as $X_0'X_0$ where $X_0$ is a n0 x p
     * %               matrix coming from previous experiments (assuming that the
     * %               intercept is included in the model)
     * %
     * %               The prior distribution of $\\tau_0$ is a gamma distribution with
     * %               parameters $a_0$ and $b_0$, that is
     * %
     * %                \\[     p(\\tau_0) \\propto \\tau^{a_0-1} \\exp (-b_0 \\tau)
     * %                       \\qquad   E(\\tau_0)= a_0/b_0               \\]
     * %
     * %    tau0 :     Prior estimate of tau. Scalar. Prior estimate of $\\tau=1/ 
     * \\sigma^2 =a_0/b_0$.
     * %      n0 :     Number of previous experiments. Scalar. Sometimes it helps
     * %               to think of the prior information as coming from n0
     * %               previous experiments. Therefore we assume that matrix X0
     * %               (which defines R), was made up of n0 observations.
     * </pre>
     *
     * @param nargout Number of outputs to return.
     * @param rhs The inputs to the M function.
     *
     * @return Array of length nargout containing the function outputs. Outputs are 
     * returned as sub-classes of <code>com.mathworks.toolbox.javabuilder.MWArray</code>. 
     * Each output array should be freed by calling its <code>dispose()</code> method.
     *
     * @throws java.jmi.RemoteException An error has occurred during the function call or 
     * in communication with the server.
     */
    public Object[] FSRBmdr(int nargout, Object... rhs) throws RemoteException;
    /**
     * Provides the standard interface for calling the <code>FSRbsb</code> M-function 
     * with 4 input arguments.  
     *
     * Input arguments to standard interface methods may be passed as sub-classes of 
     * <code>com.mathworks.toolbox.javabuilder.MWArray</code>, or as arrays of any 
     * supported Java type (i.e. scalars and multidimensional arrays of any numeric, 
     * boolean, or character type, or String). Arguments passed as Java types are 
     * converted to MATLAB arrays according to default conversion rules.
     *
     * All inputs to this method must implement either Serializable (pass-by-value) or 
     * Remote (pass-by-reference) as per the RMI specification.
     *
     * M-documentation as provided by the author of the M function:
     * <pre>
     * %FSRbsb returns the units belonging to the subset in each step of the forward 
     * search
     * %
     * %<a href="matlab: docsearchFS('FSRbsb')">Link to the help function</a>
     * %
     * % Required input arguments:
     * %
     * %    y    :     Response variable. Vector. A vector with n elements that contains
     * %               the response variable. y can be either a row or a column vector.
     * %  X :          Predictor variables. Matrix.
     * %               Matrix of explanatory variables (also called 'regressors')
     * %               of dimension n x (p-1) where p denotes the number of
     * %               explanatory variables including the intercept.
     * %               Rows of X represent observations, and columns represent
     * %               variables. By default, there is a constant term in the
     * %               model, unless you explicitly remove it using input option
     * %               intercept, so do not include a column of 1s in X. Missing
     * %               values (NaN's) and infinite values (Inf's) are allowed,
     * %               since observations (rows) with missing or infinite values
     * %               will automatically be excluded from the computations..
     * %  bsb :        list of units forming the initial subset. Vector | 0. If
     * %               bsb=0 then the procedure starts with p units randomly
     * %               chosen else if bsb is not 0 the search will start with
     * %               m0=length(bsb)
     * %
     * % Optional input arguments:
     * %
     * %       init  :     Search initialization. Scalar.
     * %                   It specifies the initial subset size to start
     * %                   monitoring units forming subset
     * %                   Example - 'init',100 starts the search from step m=100
     * %                   Data Types - double
     * %   intercept :    Indicator for constant term. Scalar.
     * %                  If 1, a model with constant term will be fitted (default),
     * %                  else no constant term will be included.
     * %                  Example - 'intercept',1
     * %                  Data Types - double
     * %    nocheck  :    Check input arguments. Scalar.
     * %                  If nocheck is equal to 1 no check is performed on
     * %                  matrix y and matrix X. Notice that y and X are left
     * %                  unchanged. In other words the additioanl column of ones for
     * %                  the intercept is not added. As default nocheck=0.
     * %                  Example - 'nocheck',1
     * %                  Data Types - double
     * %   bsbsteps :  Save the units forming subsets in selected steps. Vector.
     * %               It specifies for which steps of the fwd search it is
     * %               necessary to save the units forming subset. If bsbsteps is
     * %               0 we store the units forming subset in all steps. The
     * %               default is store the units forming subset in all steps if
     * %               n<=5000, else to store the units forming subset at steps
     * %               init and steps which are multiple of 100. For example, as
     * %               default, if n=7530 and init=6, units forming subset are
     * %               stored for
     * %               m=init, 100, 200, ..., 7500.
     * %               Example - 'bsbsteps',[100 200] stores the unis forming
     * %               subset in steps 100 and 200.
     * %               Data Types - double
     * %       plots   : Plot on the screen. Scalar.
     * %                 If plots=1 the monitoring units plot is displayed on the
     * %                 screen. The default value of plots is 0 (that is no plot
     * %                 is produced on the screen).
     * %                 Example - 'plots',1
     * %                 Data Types - double
     * %
     * % Output:
     * %
     * %  Un:          Units included in each step. Matrix.
     * %               (n-init) x 11 Matrix which contains the unit(s) included
     * %               in the subset at each step of the search.
     * %               REMARK: in every step the new subset is compared with the
     * %               old subset. Un contains the unit(s) present in the new
     * %               subset but not in the old one.
     * %               Un(1,2) for example contains the unit included in step
     * %               init+1.
     * %               Un(end,2) contains the units included in the final step
     * %               of the search.
     * %  BB:          Units belonging to subset in each step or selected steps. Matrix.
     * %               n-by-(n-init+1) or n-by-length(bsbsteps) matrix which
     * %               contains the units belonging to the subset at each step (or
     * %               in selected steps as specified by optional vector bsbsteps)
     * %               of the forward search.
     * %               More precisely:
     * %               BB(:,1) contains the units forming subset in step bsbsteps(1);
     * %               ....;
     * %               BB(:,end) contains the units forming subset in step  bsbsteps(end);
     * %               Row 1 of matrix BB is referred to unit 1;
     * %               ......;
     * %               Row n of matrix BB is referred to unit n;
     * %               Units not belonging to subset are denoted with NaN.
     * %
     * % See also FSRBbsb, FSRHbsb
     * %
     * % See also: FSReda
     * %
     * % References:
     * %
     * %   Atkinson and Riani (2000), Robust Diagnostic Regression Analysis,
     * %   Springer Verlag, New York.
     * %
     * % Copyright 2008-2016.
     * % Written by FSDA team
     * %
     * %
     * %<a href="matlab: docsearchFS('FSRbsb')">Link to the help function</a>
     * % Last modified 31-05-2016
     * </pre>
     *
     * @param nargout Number of outputs to return.
     * @param rhs The inputs to the M function.
     *
     * @return Array of length nargout containing the function outputs. Outputs are 
     * returned as sub-classes of <code>com.mathworks.toolbox.javabuilder.MWArray</code>. 
     * Each output array should be freed by calling its <code>dispose()</code> method.
     *
     * @throws java.jmi.RemoteException An error has occurred during the function call or 
     * in communication with the server.
     */
    public Object[] FSRbsb(int nargout, Object... rhs) throws RemoteException;
    /**
     * Provides the standard interface for calling the <code>FSReda</code> M-function 
     * with 4 input arguments.  
     *
     * Input arguments to standard interface methods may be passed as sub-classes of 
     * <code>com.mathworks.toolbox.javabuilder.MWArray</code>, or as arrays of any 
     * supported Java type (i.e. scalars and multidimensional arrays of any numeric, 
     * boolean, or character type, or String). Arguments passed as Java types are 
     * converted to MATLAB arrays according to default conversion rules.
     *
     * All inputs to this method must implement either Serializable (pass-by-value) or 
     * Remote (pass-by-reference) as per the RMI specification.
     *
     * M-documentation as provided by the author of the M function:
     * <pre>
     * %FSReda enables to monitor several quantities in each step of the forward search
     * %
     * %<a href="matlab: docsearchFS('FSReda')">Link to the help function</a>
     * %
     * % Required input arguments:
     * %
     * %   y:          A vector with n elements that contains the response variables.
     * %               Missing values (NaN's) and infinite values (Inf's) are
     * %               allowed, since observations (rows) with missing or infinite
     * %               values will automatically be excluded from the
     * %               computations.
     * %   X :         Data matrix of explanatory variables (also called 'regressors')
     * %               of dimension (n x p-1). Rows of X represent observations, and
     * %               columns represent variables. Missing values (NaN's) and
     * %               infinite values (Inf's) are allowed, since observations
     * %               (rows) with missing or infinite values will automatically
     * %               be excluded from the computations.
     * %   bsb :       list of units forming the initial
     * %               subset. Vector or scalar. If bsb=0 (default) then the procedure 
     * starts with p
     * %               units randomly chosen else if bsb is not 0 the search will
     * %               start with m0=length(bsb).
     * %
     * % Optional input arguments:
     * %
     * %   intercept : Indicator for constant term. Scalar.
     * %                     If 1, a model with constant term will be fitted (default),
     * %                     else no constant term will be included.
     * %                       Example - 'intercept',1
     * %                       Data Types - double
     * %        init :      Search initialization. Scalar.
     * %                      It specifies the point where to initialize the search
     * %                       and start monitoring required diagnostics. if init is not
     * %                       specified it will be set equal to :
     * %                       p+1, if the sample size is smaller than 40;
     * %                       min(3*p+1,floor(0.5*(n+p+1))), otherwise.
     * %                       Example - 'init',100 starts monitoring from step m=100
     * %                       Data Types - double
     * %      nocheck:  Check input arguments. Scalar.
     * %                       If nocheck is equal to 1 no check is performed on
     * %                       matrix y and matrix X. Notice that y and X are left
     * %                       unchanged. In other words the additional column of ones for
     * %                       the intercept is not added. As default nocheck=0. The
     * %                       controls on h, alpha and nsamp still remain
     * %                       Example - 'nocheck',1
     * %                       Data Types - double
     * %        tstat:      the kind of t-statistics which have to be monitored.
     * %               Character.
     * %               tstat = 'trad' implies  monitoring of traditional t
     * %               statistics (out.Tols). In this case the estimate of $\\sigma^2$ at 
     * step m
     * %               is based on $s^2_m$ (notice that $s^2_m<<\\sigma^2$ when m/n is
     * %               small) tstat = 'scal' (default) implies monitoring of
     * %               rescaled t statistics In this case the estimate of
     * %               $\\sigma^2$ at step m is based on $s^2_m / var_{truncnorm(m/n)}$
     * %               where $var_{truncnorm(m/n)}$ is the variance of the truncated
     * %               normal distribution.
     * %               Example - 'tstat','trad'
     * %               Data Types - char
     * %  conflev:   confidence levels to be used to compute confidence interval
     * %               for the elements of $\\beta$ and for $\\sigma^2$. Vector.
     * %               The default value of conflev is [0.95 0.99] that
     * %               is 95% and 99% confidence intervals are computed.
     * %               Example - 'conflev',[0.90 0.93] 
     * %               Data Types - double
     * % Remark:       The user should only give the input arguments that have to
     * %               change their default value. The name of the input arguments
     * %               needs to be followed by their value. The order of the input
     * %               arguments is of no importance.
     * %
     * %               Missing values (NaN's) and infinite values (Inf's) are allowed,
     * %               since observations (rows) with missing or infinite values
     * %               will automatically be excluded from the computations. y can
     * %               be both a row of column vector.
     * %
     * % Output:
     * %
     * %         out:   structure which contains the following fields
     * %
     * %   out.RES=        n x (n-init+1) = matrix containing the monitoring of
     * %               scaled residuals: 
     * %               1st row = residual for first unit; 
     * %               ...; 
     * %               nth row = residual for nth unit.
     * %   out.LEV=        (n+1) x (n-init+1) = matrix containing the monitoring of
     * %               leverage: 
     * %               1st row = leverage for first unit: 
     * %               ...; 
     * %               nth row = leverage for nth unit.
     * %    out.BB=        n x (n-init+1) matrix containing the information about the 
     * units belonging
     * %               to the subset at each step of the forward search: 
     * %               1st col = indexes of the units forming subset in the
     * %               initial step; 
     * %               ...; 
     * %               last column = units forming subset in the final step (all
     * %               units).
     * %   out.mdr=        n-init x 3 matrix which contains the monitoring of minimum
     * %               deletion residual or (m+1)ordered residual  at each step of
     * %               the forward search: 
     * %               1st col = fwd search index (from init to n-1); 
     * %               2nd col = minimum deletion residual; 
     * %               3rd col = (m+1)-ordered residual. 
     * %               Remark: these quantities are stored with sign, that is the
     * %               min deletion residual is stored with negative sign if
     * %               it corresponds to a negative residual.
     * %   out.msr=        n-init+1 x 3 = matrix which contains the monitoring of
     * %               maximum studentized residual or m-th ordered residual: 
     * %               1st col = fwd search index (from init to n); 
     * %               2nd col = maximum studentized residual; 
     * %               3rd col = (m)-ordered studentized residual.
     * %   out.nor=        (n-init+1) x 4 matrix containing the monitoring of
     * %               normality test in each step of the forward search: 
     * %               1st col = fwd search index (from init to n);
     * %               2nd col = Asymmetry test;
     * %               3rd col = Kurtosis test;
     * %               4th col = Normality test.
     * %  out.Bols=        (n-init+1) x (p+1) matrix containing the monitoring of
     * %               estimated beta coefficients in each step of the forward
     * %               search.
     * %    out.S2=       (n-init+1) x 4 matrix containing the monitoring of S2 or R2
     * %               in each step of the forward search: 
     * %               1st col = fwd search index (from init to n); 
     * %               2nd col = monitoring of S2; 
     * %               3rd col = monitoring of R2; 
     * %               4th col = monitoring of rescaled S2. 
     * %               In this case the
     * %               estimated of $\\sigma^2$ at step m is divided by the
     * %               consistency factor (to make the estimate asymptotically
     * %               unbiased).
     * %   out.coo=    (n-init+1) x 3 matrix containing the monitoring of Cook or
     * %               modified Cook distance in each step of the forward search: 
     * %               1st col = fwd search index (from init to n); 
     * %               2nd col = monitoring of Cook distance; 
     * %               3rd col = monitoring of modified Cook distance.
     * %  out.Tols=    (n-init+1) x (p+1) matrix containing the monitoring of
     * %               estimated t-statistics (as specified in option input
     * %               'tstat'.
     * %               in each step of the forward search
     * %   out.Un=        (n-init) x 11 Matrix which contains the unit(s)
     * %               included in the subset at each step of the fwd search. 
     * %               REMARK: in every step the new subset is compared with the
     * %               old subset. Un contains the unit(s) present in the new
     * %               subset but not in the old one Un(1,2) for example contains
     * %               the unit included in step init+1 Un(end,2) contains the
     * %               units included in the final step of the search.
     * %  out.betaINT = Confidence intervals for the elements of $\\beta$.
     * %                 betaINT is a (n-init+1)-by-2*length(confint)-by-p 3D array.
     * %                 Each third dimension refers to an element of beta: 
     * %                 betaINT(:,:,1) is associated with first element of beta; 
     * %                 ...; 
     * %                 betaINT(:,:,p) is associated with last element of beta. 
     * %                 The first two columns contain the lower
     * %                 and upper confidence limits associated with conflev(1).
     * %                 Columns three and four contain the lower
     * %                 and upper confidence limits associated with conflev(2); 
     * %                 ...; 
     * %                 The last two columns contain the lower
     * %                 and upper confidence limits associated with conflev(end).
     * %                 
     * %                 For example betaint(:,3:4,5) contain the lower and upper
     * %                 confidence limits for the fifth element of beta using
     * %                 confidence level specified in the second element of input
     * %                 option conflev.
     * %out.sigma2INT = confidence interval for $\\sigma^2$. 
     * %                1st col = fwd search index; 
     * %                2nd col = lower confidence limit based on conflev(1);
     * %                3rd col = upper confidence limit based on conflev(1);
     * %                4th col = lower confidence limit based on conflev(2);
     * %                5th col = upper confidence limit based on conflev(2);
     * %                ... 
     * %                penultimate col = lower confidence limit based on conflev(end);
     * %                last col = upper confidence limit based on conflev(end);
     * %     out.y=     A vector with n elements that contains the response
     * %               variable which has been used
     * %     out.X=    Data matrix of explanatory variables
     * %               which has been used (it also contains the column of ones if
     * %               input option intercept was missing or equal to 1)
     * %  out.class =  'FSReda'.
     * %
     * %
     * % See also LXS.m, FSRbsb.m
     * %
     * % References:
     * %
     * %   Atkinson and Riani (2000), Robust Diagnostic Regression Analysis,
     * %   Springer Verlag, New York.
     * %
     * %
     * % Copyright 2008-2016.
     * % Written by FSDA team
     * %
     * %
     * %<a href="matlab: docsearchFS('FSReda')">Link to the help function</a>
     * % Last modified 14-06-2016
     * </pre>
     *
     * @param nargout Number of outputs to return.
     * @param rhs The inputs to the M function.
     *
     * @return Array of length nargout containing the function outputs. Outputs are 
     * returned as sub-classes of <code>com.mathworks.toolbox.javabuilder.MWArray</code>. 
     * Each output array should be freed by calling its <code>dispose()</code> method.
     *
     * @throws java.jmi.RemoteException An error has occurred during the function call or 
     * in communication with the server.
     */
    public Object[] FSReda(int nargout, Object... rhs) throws RemoteException;
    /**
     * Provides the standard interface for calling the <code>FSRenvmdr</code> M-function 
     * with 3 input arguments.  
     *
     * Input arguments to standard interface methods may be passed as sub-classes of 
     * <code>com.mathworks.toolbox.javabuilder.MWArray</code>, or as arrays of any 
     * supported Java type (i.e. scalars and multidimensional arrays of any numeric, 
     * boolean, or character type, or String). Arguments passed as Java types are 
     * converted to MATLAB arrays according to default conversion rules.
     *
     * All inputs to this method must implement either Serializable (pass-by-value) or 
     * Remote (pass-by-reference) as per the RMI specification.
     *
     * M-documentation as provided by the author of the M function:
     * <pre>
     * %FSRenvmdr computes the theoretical envelopes of Minimum Deletion Residual outside 
     * subset during the search
     * %
     * %<a href="matlab: docsearchFS('FSRenvmdr')">Link to the help function</a>
     * %
     * %  Required input arguments:
     * %
     * %    n : number of observations. Scalar. Number of observations on which
     * %       the envelopes are based.
     * %    p : number of explanatory variables (including the intercept if
     * %    present). Scalar. Number of expl. variables on which
     * %       the envelopes are based.
     * %
     * %  Optional input arguments:
     * %
     * %   init:       Search initialization. Scalar.
     * %               Scalar which specifies the initial subset size to monitor
     * %               minimum deletion residual, if init is not specified it will
     * %               be set equal to
     * %                   p+1, if the sample size is smaller than 40;
     * %                   min(3*p+1,floor(0.5*(n+p+1))), otherwise.
     * %               Example - 'init',100 starts monitoring from step m=100 
     * %               Data Types - double
     * %  prob:    quantiles for which envelopes have
     * %               to be computed. Vector.
     * %               1 x k vector containing quantiles for which envelopes have
     * %               to be computed. The default is to produce 1%, 50% and 99%
     * %               envelopes.
     * %               Example - 'prob',[0.01 0.99] 
     * %               Data Types - double
     * %  exact:    Method for the calculation of the quantiles. Scalar.
     * %                If it is equal to 1 (default) the calculation of the quantiles
     * %               of the T and F distribution is based on functions finv and
     * %               tinv from the Matlab statistics toolbox, otherwise the
     * %               calculations of the former quantiles is based on functions
     * %               finvFS and tinvFS. The solution has a tolerance of 1e-8
     * %               (change variable tol in files finvFS.m and tinvFS.m if
     * %               required.
     * %               Example - 'exact',0
     * %               Data Types - double
     * %               Remark: the use of functions tinv and finv is more precise
     * %               but requires more time.
     * %
     * %  Output:
     * %
     * %  MDRenv:      forward envelopes of mdr. Matrix. Matrix with n-m0+1 rows
     * %               and length(prob)+1 columns.
     * %               1st col = fwd search index from m0 to n-1;
     * %               2nd col = envelope for quantile prob(1);
     * %               3rd col = envelope for quantile prob(2)
     * %               ...
     * %               (k+1) col = envelope for quantile prob(k).
     * %
     * % Subfunctions: tinvFS, finvFS, tcdfFS, fpdfFS, fcdfFS. 
     * %
     * % Other function dependencies: none.
     * %
     * % See also LXS.m, FSREDA.m
     * %
     * % References:
     * %
     * %   Atkinson, A.C. and Riani, M. (2006). Distribution theory and
     * %   simulations for tests of outliers in regression. Journal of
     * %   Computational and Graphical Statistics, Vol. 15, pp. 460-476
     * %   Riani, M. and Atkinson, A.C. (2007). Fast calibrations of the forward
     * %   search for testing multiple outliers in regression, Advances in Data
     * %   Analysis and Classification, Vol. 1, pp. 123-141.
     * %
     * % Copyright 2008-2016.
     * % Written by FSDA team
     * %
     * %
     * %<a href="matlab: docsearchFS('FSRenvmdr')">Link to the help function</a>
     * % Last modified 31-05-2016
     * </pre>
     *
     * @param nargout Number of outputs to return.
     * @param rhs The inputs to the M function.
     *
     * @return Array of length nargout containing the function outputs. Outputs are 
     * returned as sub-classes of <code>com.mathworks.toolbox.javabuilder.MWArray</code>. 
     * Each output array should be freed by calling its <code>dispose()</code> method.
     *
     * @throws java.jmi.RemoteException An error has occurred during the function call or 
     * in communication with the server.
     */
    public Object[] FSRenvmdr(int nargout, Object... rhs) throws RemoteException;
    /**
     * Provides the standard interface for calling the <code>FSRmdr</code> M-function 
     * with 4 input arguments.  
     *
     * Input arguments to standard interface methods may be passed as sub-classes of 
     * <code>com.mathworks.toolbox.javabuilder.MWArray</code>, or as arrays of any 
     * supported Java type (i.e. scalars and multidimensional arrays of any numeric, 
     * boolean, or character type, or String). Arguments passed as Java types are 
     * converted to MATLAB arrays according to default conversion rules.
     *
     * All inputs to this method must implement either Serializable (pass-by-value) or 
     * Remote (pass-by-reference) as per the RMI specification.
     *
     * M-documentation as provided by the author of the M function:
     * <pre>
     * %FSRmdr computes minimum deletion residual and other basic linear regression 
     * quantities in each step of the search
     * %
     * %<a href="matlab: docsearchFS('FSRmdr')">Link to the help function</a>
     * %
     * % Required input arguments:
     * %
     * %    y:         Response variable. Vector. Response variable, specified as
     * %               a vector of length n, where n is the number of
     * %               observations. Each entry in y is the response for the
     * %               corresponding row of X.
     * %               Missing values (NaN's) and infinite values (Inf's) are
     * %               allowed, since observations (rows) with missing or infinite
     * %               values will automatically be excluded from the
     * %               computations.
     * %  X :          Predictor variables. Matrix. Matrix of explanatory
     * %               variables (also called 'regressors') of dimension n x (p-1)
     * %               where p denotes the number of explanatory variables
     * %               including the intercept.
     * %               Rows of X represent observations, and columns represent
     * %               variables. By default, there is a constant term in the
     * %               model, unless you explicitly remove it using input option
     * %               intercept, so do not include a column of 1s in X. Missing
     * %               values (NaN's) and infinite values (Inf's) are allowed,
     * %               since observations (rows) with missing or infinite values
     * %               will automatically be excluded from the computations.
     * %  bsb     :    list of units forming the initial subset. Vector. If bsb=0
     * %               (default) then the procedure starts with p units randomly
     * %               chosen else if bsb is not 0 the search will start with
     * %               m0=length(bsb)
     * %
     * % Optional input arguments:
     * %
     * %  init :       Search initialization. Scalar.
     * %               It specifies the point where to initialize the search and
     * %               start monitoring required diagnostics. If it is not
     * %               specified it is set equal to:
     * %                   p+1, if the sample size is smaller than 40;
     * %                   min(3*p+1,floor(0.5*(n+p+1))), otherwise.
     * %               Example - 'init',100 starts monitoring from step m=100
     * %               Data Types - double
     * %  intercept :  Indicator for constant term. Scalar. If 1, a model with
     * %               constant term will be fitted (default), else no constant
     * %               term will be included.
     * %               Example - 'intercept',1
     * %               Data Types - double
     * %  plots :      Plot on the screen. Scalar. If equal to one a plot of
     * %               minimum deletion residual appears  on the screen with 1%,
     * %               50% and 99% confidence bands else (default) no plot is
     * %               shown.
     * %               Example - 'plots',1
     * %               Data Types - double
     * %               Remark: the plot which is produced is very simple. In order
     * %               to control a series of options in this plot and in order to
     * %               connect it dynamically to the other forward plots it is
     * %               necessary to use function mdrplot.
     * %  nocheck:     Check input arguments. Scalar. If nocheck is equal to 1 no check 
     * is performed on
     * %               matrix y and matrix X. Notice that y and X are left
     * %               unchanged. In other words the additioanl column of ones for
     * %               the intercept is not added. As default nocheck=0. The
     * %               controls on h, alpha and nsamp still remain
     * %               Example - 'nocheck',1
     * %               Data Types - double
     * %  msg  :       Level of output to display. Scalar. It controls whether to
     * %               display or not messages about great interchange on the
     * %               screen If msg==1 (default)
     * %               messages are displayed on the screen
     * %               else no message is displayed on the screen
     * %               Example - 'msg',1
     * %               Data Types - double
     * %  constr :     Constrained search. Vector. r x 1 vector which contains the list 
     * of units which are
     * %               forced to join the search in the last r steps. The default
     * %               is constr=''.  No constraint is imposed
     * %               Example - 'constr',[1:10] forces the first 10 units to join
     * %               the subset in the last 10 steps
     * %               Data Types - double
     * % bsbmfullrank :What to do in case subset at step m (say bsbm) produces a
     * %               non singular X. Scalar.
     * %               This options controls what to do when rank(X(bsbm,:)) is
     * %               smaller then number of explanatory variables.
     * %               If bsbmfullrank = 1 (default is 1) these units (whose number
     * %               is say mnofullrank) are constrained to enter the search in
     * %               the final n-mnofullrank steps else the search continues
     * %               using as estimate of beta at step m the estimate of beta
     * %               found in the previous step.
     * %               Example - 'bsbmfullrank',1
     * %               Data Types - double
     * %   bsbsteps :  Save the units forming subsets. Vector. It specifies for
     * %               which steps of the fwd search it
     * %               is necessary to save the units forming subsets. If bsbsteps
     * %               is 0 we store the units forming subset in all steps. The
     * %               default is store the units forming subset in all steps if
     * %               n<=5000, else to store the units forming subset at steps
     * %               init and steps which are multiple of 100. For example, as
     * %               default, if n=753 and init=6,
     * %               units forming subset are stored for
     * %               m=init, 100, 200, 300, 400, 500 and 600.
     * %               Example - 'bsbsteps',[100 200] stores the unis forming
     * %               subset in steps 100 and 200.
     * %               Data Types - double
     * %  Remark:      The user should only give the input arguments that have to
     * %               change their default value.
     * %               The name of the input arguments needs to be followed by
     * %               their value. The order of the input arguments is of no
     * %               importance.
     * %
     * %               Missing values (NaN's) and infinite values (Inf's) are
     * %               allowed, since observations (rows) with missing or infinite
     * %               values will automatically be excluded from the
     * %               computations. y can be both a row of column vector.
     * %
     * % Output:
     * %
     * %  mdr:          n -init x 2 matrix which contains the monitoring of minimum
     * %               deletion residual at each step of the forward search.
     * %               1st col = fwd search index (from init to n-1).
     * %               2nd col = minimum deletion residual.
     * %               REMARK: if in a certain step of the search matrix is
     * %               singular, this procedure checks ohw many observations
     * %               produce a singular matrix. In this case mdr is a column
     * %               vector which contains the list of units for which matrix X
     * %               is non singular.
     * %  Un:          Units included in each step. Matrix.
     * %               (n-init) x 11 Matrix which contains the unit(s) included
     * %               in the subset at each step of the search.
     * %               REMARK: in every step the new subset is compared with the
     * %               old subset. Un contains the unit(s) present in the new
     * %               subset but not in the old one.
     * %               Un(1,2) for example contains the unit included in step
     * %               init+1.
     * %               Un(end,2) contains the units included in the final step
     * %               of the search.
     * %  BB:          Units belonging to subset in each step. Matrix.
     * %               n x (n-init+1) or n-by-length(bsbsteps) matrix (depending on input
     * %               option bsbsteps) which contains information about the units
     * %               belonging to the subset at each step of the forward search.
     * %               BB has the following structure
     * %               1-st row has number 1 in correspondence of the steps in
     * %                   which unit 1 is included inside subset and a missing
     * %                   value for the other steps
     * %               ......
     * %               (n-1)-th row has number n-1 in correspondence of the steps in
     * %                   which unit n-1 is included inside subset and a missing
     * %                   value for the other steps
     * %               n-th row has number n in correspondence of the steps in
     * %                   which unit n is included inside subset and a missing
     * %                   value for the other steps
     * %               The size of matrix BB is n x (n-init+1) if option input
     * %               bsbsteps is 0 else the size is n-by-length(bsbsteps).
     * %  Bols:        OLS coefficents. Matrix.
     * %               (n-init+1) x (p+1) matrix containing the monitoring of
     * %               estimated beta coefficients in each step of the forward
     * %               search.
     * %  S2:          S2 and R2. Matrix.
     * %               (n-init+1) x 3 matrix containing the monitoring of S2 (2nd
     * %               column)and R2 (third column) in each step of the forward
     * %               search.
     * %
     * % See also: FSR, FSReda
     * %
     * % References:
     * %
     * %   Atkinson and Riani (2000), Robust Diagnostic Regression Analysis,
     * %   Springer Verlag, New York.
     * %   Atkinson, A.C. and Riani, M. (2006). Distribution theory and
     * %   simulations for tests of outliers in regression. Journal of
     * %   Computational and Graphical Statistics, Vol. 15, pp. 460-476
     * %   Riani, M. and Atkinson, A.C. (2007). Fast calibrations of the forward
     * %   search for testing multiple outliers in regression, Advances in Data
     * %   Analysis and Classification, Vol. 1, pp. 123-141.
     * %
     * % Copyright 2008-2016.
     * % Written by FSDA team
     * %
     * %
     * %<a href="matlab: docsearchFS('FSRmdr')">Link to the help function</a>
     * % Last modified 14-06-2016
     * </pre>
     *
     * @param nargout Number of outputs to return.
     * @param rhs The inputs to the M function.
     *
     * @return Array of length nargout containing the function outputs. Outputs are 
     * returned as sub-classes of <code>com.mathworks.toolbox.javabuilder.MWArray</code>. 
     * Each output array should be freed by calling its <code>dispose()</code> method.
     *
     * @throws java.jmi.RemoteException An error has occurred during the function call or 
     * in communication with the server.
     */
    public Object[] FSRmdr(int nargout, Object... rhs) throws RemoteException;
    /**
     * Provides the standard interface for calling the <code>levfwdplot</code> M-function 
     * with 2 input arguments.  
     *
     * Input arguments to standard interface methods may be passed as sub-classes of 
     * <code>com.mathworks.toolbox.javabuilder.MWArray</code>, or as arrays of any 
     * supported Java type (i.e. scalars and multidimensional arrays of any numeric, 
     * boolean, or character type, or String). Arguments passed as Java types are 
     * converted to MATLAB arrays according to default conversion rules.
     *
     * All inputs to this method must implement either Serializable (pass-by-value) or 
     * Remote (pass-by-reference) as per the RMI specification.
     *
     * M-documentation as provided by the author of the M function:
     * <pre>
     * %levfwdplot plots the trajectories of leverage along the search
     * %
     * %<a href="matlab: docsearchFS('levfwdplot')">Link to the help function</a>
     * %
     * % Required input arguments:
     * %
     * %  out :  Structure containing monitoring of leverage. Structure. 
     * %               Structure containing the following fields.
     * %     out.LEV   =   matrix containing the leverage monitored in each step of
     * %               the forward search. Every row is associated with a unit.
     * %               This matrix can be created using function FSReda
     * %               (compulsory argument)
     * %       out.Un  =   matrix containing the order of entry of each unit
     * %               (necessary only if datatooltip or databrush are not empty)
     * %       out.y   =   a vector containing the response (necessary only if
     * %               option databrush is not empty)
     * %       out.X   =   a matrix containing the explanatory variables
     * %               (necessary only if option databrush is not empty)
     * %     out.Bols  =   (n-init+1) x (p+1) matrix containing the monitoring of
     * %               estimated beta coefficients in each step of the forward search
     * %               (necessary only if option databrush is not empty and
     * %               suboption lineadd is not empty)
     * %      Data Types - struct
     * %
     * % Optional input arguments:
     * %           standard : appearance of the plot
     * %                   in terms of xlim, ylim, axes labels and their font size
     * %                   style, color of the lines, etc. Structure. 
     * %                   Structure standard contains the following fields:
     * %                   standard.SizeAxesNum = scalar specifying the fontsize of the
     * %                       axes numbers. Default value is 10.
     * %                   standard.xlim = two elements vector with minimum and maximum of
     * %                       the x axis. Default value is '' (automatic scale).
     * %                   standard.ylim = two elements vector with minimum and maximum of
     * %                       the y axis. Default value is '' (automatic scale).
     * %                   standard.titl = a label for the title (default: '').
     * %                   standard.labx = a label for the x-axis (default: 'Subset size 
     * m').
     * %                   standard.laby = a label for the y-axis (default:'Leverage').
     * %                   standard.SizeAxesLab = Scalar specifying the fontsize of the
     * %                       labels of the axes. Default value is 12.
     * %                   standard.subsize = numeric vector containing the subset size
     * %                       with length equal to the number of columns of
     * %                       the leverage matrix. The default value of subsize 
     * %                       is (n-nsteps+1):n
     * %                   standard.LineWidth =: scalar specifying line width for the
     * %                       trajectories.
     * %                   standard.Color = cell array of strings containing the colors to
     * %                       be used for the highlighted units.
     * %                       If length(Color)=1 the same color will be used for
     * %                       all units.
     * %                       If length(Color)=2 half of the trajectories will
     * %                       appear with Color{1} and the other half with
     * %                       Color{2}. And so on with 3 cell elements, etc.
     * %                   standard.LineStyle = cell containing the line types.
     * %
     * %                   Remark. The default values of structure standard are:
     * %                   standard.SizeAxesNum=10
     * %                   standard.SizeAxesLab=12
     * %                   standard.xlim='' (Automatic scale)
     * %                   standard.ylim='' (Automatic scale)
     * %                   standard.titl='' (empty title)
     * %                   standard.labx='Subset size m'
     * %                   standard.laby='Leverage'
     * %                   standard.LineWidth=1
     * %                   standard.Color={'b'}
     * %                   standard.LineStyle={'-'}
     * %
     * %                   Example - 'standard.LineWidth','1'
     * %                   Data Types - struct 
     * %
     * %         fground : trajectories in foregroud.
     * %                   Structure. Structure which controls which trajectories
     * %                   are highlighted and how they are plotted to be
     * %                   distinguishable from the others.
     * %                   It is possible to control the label, the width, the
     * %                   color, the line type and the marker of the highlighted
     * %                   units. 
     * %                   Structure fground contains the following fields:
     * %                   fground.fthresh = (alternative to funit) numeric vector of
     * %                       length 1 or 2 which specifies the highlighted
     * %                       trajectories.
     * %                       -   If length(fthresh)=1 the highlighted trajectories
     * %                           are those of units that after step [n/2 + 1]
     * %                           have at least once a leverage bigger than
     * %                           fthresh. Alternatively (if option 'xground' is
     * %                           set to be 'res' by the user) the trajectories  
     * %                           are highlighted if throughtout the search the 
     * %                           units had at leat once a residual (in absolute
     * %                           value) greater than fthresh. 
     * %                           The default value of fthresh is 2p/n for
     * %                           leverage values or 2.5 for residual values.
     * %                       -   If length(fthresh)=2 the highlighted trajectories
     * %                           are those of units that throughtout the search
     * %                           had a leverage value at leat once bigger than
     * %                           fthresh(2) or smaller than fthresh(1).
     * %                   fground.funit : (alternative to fthresh) vector containing the
     * %                       list of the units to be highlighted. If funit is
     * %                       supplied, fthresh is ignored.
     * %                   fground.flabstep : numeric vector which specifies the steps of
     * %                       the search where to put labels for the highlighted
     * %                       trajectories (units). The default is to put the
     * %                       labels at the initial and final steps of the search.
     * %                       flabstep='' means no label.
     * %                   fground.LineWidth : scalar specifying line width for the
     * %                       highlighted trajectories (units). Default is 1.
     * %                   fground.Color : cell array of strings containing the colors to
     * %                       be used for the highlighted trajectories (units).
     * %                       If length(scolor)==1 the same color will be used for
     * %                       all highlighted units Remark: if for example
     * %                       length(scolor)=2 and there are 6 highlighted units,
     * %                       3 highlighted trajectories appear with
     * %                       selunitcolor{1} and 3 highlighted trajectories with
     * %                       selunitcolor{2}
     * %                   fground.LineStyle : cell containing the line type of the 
     * highlighted
     * %                       trajectories.
     * %                   fground.fmark  : scalar controlling whether to plot highlighted
     * %                       trajectories as markers.
     * %                       if 1 each line is plotted using a different marker
     * %                       else no marker is used (default).
     * %
     * %                   Remark. The default values of structure fground are:
     * %                    fground.fthresh=2.5
     * %                    fground.flabstep=[m0 n]
     * %                    fground.LineWidth=1
     * %                    fground.LineStyle={'-'}
     * %
     * %                   Remark. if fground='' no unit is highlighted and no
     * %                   label is inserted into the plot.
     * %                   Example - 'fground.LineWidth','1'
     * %                   Data Types - struct 
     * %
     * %         bground : trajectories in background. Structure.
     * %                   Structure which specifies the trajectories in background,
     * %                   i.e. the trajectories corresponding to "unimmportant"
     * %                   units in the central part of the data. The structure
     * %                   also specifies the style used in the plot to give them
     * %                   less emphasis, so that to not distract the eye of the
     * %                   analyst from the trajectories of the relevant units.
     * %                   Structure bground contains the following fields:
     * %                   bground.bthresh = numeric vector of length 1 or 2 which
     * %                       specifies how to define the unimmportant trajectories.
     * %                       Unimmportant trajectories will be plotted using a
     * %                       colormap, in greysh or will be hidden.
     * %                       - If length(thresh)=1 the irrelevant units are
     * %                         those which always had a leverage smaller
     * %                         (in absolute value) than thresh.
     * %                       - If length(bthresh)=2 the irrelevant units
     * %                         are those which always had a leverage greater
     * %                         than bthresh(1) and smaller than bthresh(2).
     * %                       The default is:
     * %                          bthresh=2p/n if n>100 and bthresh=-inf if n<=100.
     * %                          Like for fthresh, if the user option xground is
     * %                          'res', then the background trajectories are set
     * %                          in relation to the residual values and the
     * %                          default threshold becomes
     * %                          bthresh=2.5 if n>100 and bthresh=-inf if n<=100.
     * %                   bground.bstyle = specifies how to plot the unimportant
     * %                       trajectories as defined in option bthresh.
     * %                       'faint': unimportant trajectories are plotted using
     * %                           a colormap.
     * %                       'hide': unimportant trajectories are hidden.
     * %                       'greysh': unimportant trajectories are displayed in
     * %                           a faint grey.
     * %                       When n>100 the default option is 'faint'.
     * %                       When n<=100 and bthresh = -Inf option bstyle is
     * %                       ignored.
     * %                   Example - 'bground.bstyle','faint'
     * %                   Data Types - struct 
     * %
     * %                   Remark: bground='' is equivalent to bground.thresh=-Inf
     * %                   that is all trajectories are considered relevant.
     * %
     * %      xground :    trajectories to highlight in connection with
     * %                   resfwdplot. Character 'lev' (default) | 'res'. 
     * %                   xground = 'lev' (default).
     * %                       The levfwdplot trajectories are put in foreground
     * %                       or in background depending on the leverage values.
     * %                   xground = 'res'.
     * %                       The levfwdplot trajectories are put in foreground
     * %                       or in background depending on the residual values.
     * %                   See options bground.bthresh and fground.fthresh.
     * %                   Example - 'xground','res'
     * %                   Data Types - char 
     * %
     * %       tag     :   Personalized tag. String. String which identifies the handle 
     * of the plot which
     * %                   is about to be created. The default is to use tag
     * %                   'pl_resfwd'. Note that if the program finds a plot which
     * %                   has a tag equal to the one specified by the user, then
     * %                   the output of the new plot overwrites the existing one
     * %                   in the same window else a new window is created
     * %                   Example - 'tag','myplot'
     * %                   Data Types - char 
     * %   datatooltip :   interactive clicking. 
     * %                   Empty value or scalar (default)| structure.  
     * %                   The default is datatooltip=1
     * %                   If datatooltip is not empty the user can use the mouse
     * %                   in order to have information about the unit selected,
     * %                   the step in which the unit enters the search and the
     * %                   associated label. If datatooltip is a structure, it is
     * %                   possible to control the aspect of the data cursor (see
     * %                   function datacursormode for more details or the
     * %                   examples below). The default options of the structure
     * %                   are DisplayStyle='Window' and SnapToDataVertex='on'.
     * %                   Example - 'datatooltip',''
     * %                   Data Types - char 
     * %       label   :   row labels. Cell of strings. Cell containing the labels
     * %                   of the units (optional argument used when
     * %                   datatooltip=1. If this field is not present labels
     * %                   row1, ..., rown will be automatically created and
     * %                   included in the pop up datatooltip window).
     * %                   Example - 'label',{'Smith','Johnson','Robert','Stallone'}
     * %                   Data Types - cell 
     * %    databrush  :   interactive mouse brushing. empty value, scalar or structure.
     * %                   If databrush is an empty value (default), no brushing
     * %                   is done.
     * %                   The activation of this option (databrush is a scalar or
     * %                   a cell) enables the user  to select a set of
     * %                   trajectories in the current plot and to see them
     * %                   highlighted in the y|X plot, i.e. a matrix of scatter
     * %                   plots of y against each column of X, grouped according
     * %                   to the selection(s) done by brushing. If the plot y|X
     * %                   does not exist it is automatically created. In
     * %                   addition, brushed units are automatically highlighted
     * %                   in the minimum deletion residual plot if it is already
     * %                   open. 
     * %                   Please note that the window style of the other figures is set
     * %                   equal to that which contains the monitoring leverage
     * %                   plot. In other words, if the monitoring leverage plot
     * %                   is docked all the other figures will be docked too
     * %                   DATABRUSH IS A SCALAR
     * %                   If databrush is a scalar the default selection tool is
     * %                   a rectangular brush and it is possible to brush only
     * %                   once (that is persist='')
     * %                   DATABRUSH IS A STRUCTURE
     * %                   If databrush is a structure, it is possible to use all
     * %                   optional arguments of function selectdataFS.m and the
     * %                   following optional argument:
     * %                   - persist. Persist is an empty value or a scalar
     * %                     containing the strings 'on' or 'off'.
     * %                     The default value of persist is '', that is brushing
     * %                     is allowed only once.
     * %                     If persist is 'on' or 'off' brushing can be done as
     * %                     many time as the user requires.
     * %                     If persist='on' then the unit(s) currently brushed
     * %                     are added to those previously brushed. it is
     * %                     possible, every time a new brushing is done, to use a
     * %                     different color for the brushed units.
     * %                     If persist='off' every time a new brush is performed
     * %                     units previously brushed are removed.
     * %                   - bivarfit. This option adds one or more least
     * %                     square lines based on SIMPLE REGRESSION to the plots
     * %                     of y|X, depending on the selected groups.
     * %                     bivarfit = ''
     * %                       is the default: no line is fitted.
     * %                     bivarfit = '1'
     * %                       fits a single ols line to all points of each
     * %                       bivariate plot in the scatter matrix y|X.
     * %                     bivarfit = '2'
     * %                       fits two ols lines: one to all points and another
     * %                       to the last selected group. This is useful when
     * %                       there are only two groups, of which one refers to a
     * %                       set of potential outliers.
     * %                     bivarfit = '0'
     * %                       fits one ols line for each selected group. This is
     * %                       useful for the purpose of fitting mixtures of
     * %                       regression lines.
     * %                     bivarfit = 'i1' or 'i2' or 'i3' etc.
     * %                       fits a ols line to a specific group, the one with
     * %                       index 'i' equal to 1, 2, 3 etc.
     * %                   - multivarfit: This option adds one or more least square
     * %                       lines, based on MULTIVARIATE REGRESSION of y on X,
     * %                       to the plots of y|Xi.
     * %                     multivarfit = ''
     * %                       is the default: no line is fitted.
     * %                     multivarfit = '1'
     * %                       fits a single ols line to all points of each
     * %                       bivariate plot in the scatter matrix y|X.
     * %                       The line added to the scatter plot y|Xi
     * %                       is avconst +Ci*Xi, where Ci is the
     * %                       coefficient of Xi in the multivariate regression
     * %                       and avconst is the effect of all the other
     * %                       explanatory variables different from Xi evaluated
     * %                       at their centroid (that is overline{y}'C))
     * %                     multivarfit = '2'
     * %                       exactly equal to multivarfit ='1' but this time we
     * %                       add the line based on the group of unselected
     * %                       observations.
     * %                   - labeladd. If this option is '1', we label the units
     * %                     of the last selected group with the unit row index in
     * %                     matrices X and y. The default value is labeladd='',
     * %                     i.e. no label is added.
     * %                   Example - 'databrush',1
     * %                   Data Types - single | double | struct 
     * %       nameX   :   Labels
     * %                   of the variables of the regression dataset. Cell array of
     * %                   strings. If it is empty (default) the sequence X1, ...,
     * %                   Xp will be created automatically
     * %                   Example - 'nameX',{'var1', var2, 'var3'}
     * %                   Data Types - cell of strings 
     * %       namey   :   label of the response. Character. Character containing
     * %                   the label of the response
     * %                   Example - 'namey','response'
     * %                   Data Types - char 
     * %       msg     :   display or save used options. Scalar which controls whether to 
     * display or to save
     * %                   as output the options inside structures standard,
     * %                   fground and bground which have been used to draw the
     * %                   plot.
     * %                   plotopt=levfwdplot(out,'msg',1) enables to save inside
     * %                   cell  plotopt the options which have been used to draw
     * %                   the three types of trajectories (standard, foreground
     * %                   and background)
     * %                   plotopt=resfwdplot(out,'msg',2) saves inside cell plotopt
     * %                   the options which have been used and prints them on the
     * %                   screen
     * %                   Example - 'msg',1
     * %                   Data Types - single or double 
     * %
     * % Output:
     * %
     * %
     * %   plotopt : options which have been used to create the plot. Cell array
     * %               of strings. Store all options which have been used to
     * %               generate the plot inside cell plotopt.
     * %
     * %
     * % See also resfwdplot
     * %
     * % References:
     * %
     * %   Atkinson and Riani (2000), Robust Diagnostic Regression Analysis,
     * %   Springer Verlag, New York.
     * %
     * % Copyright 2008-2016.
     * % Written by FSDA team
     * %
     * %
     * %<a href="matlab: docsearchFS('levfwdplot')">Link to the help function</a>
     * % Last modified 14-06-2016
     * </pre>
     *
     * @param nargout Number of outputs to return.
     * @param rhs The inputs to the M function.
     *
     * @return Array of length nargout containing the function outputs. Outputs are 
     * returned as sub-classes of <code>com.mathworks.toolbox.javabuilder.MWArray</code>. 
     * Each output array should be freed by calling its <code>dispose()</code> method.
     *
     * @throws java.jmi.RemoteException An error has occurred during the function call or 
     * in communication with the server.
     */
    public Object[] levfwdplot(int nargout, Object... rhs) throws RemoteException;
    /**
     * Provides the standard interface for calling the <code>LXS</code> M-function with 3 
     * input arguments.  
     *
     * Input arguments to standard interface methods may be passed as sub-classes of 
     * <code>com.mathworks.toolbox.javabuilder.MWArray</code>, or as arrays of any 
     * supported Java type (i.e. scalars and multidimensional arrays of any numeric, 
     * boolean, or character type, or String). Arguments passed as Java types are 
     * converted to MATLAB arrays according to default conversion rules.
     *
     * All inputs to this method must implement either Serializable (pass-by-value) or 
     * Remote (pass-by-reference) as per the RMI specification.
     *
     * M-documentation as provided by the author of the M function:
     * <pre>
     * %LXS computes the Least Median of Squares (LMS) or Least Trimmed Squares (LTS) 
     * estimators
     * %
     * %<a href="matlab: docsearchFS('LXS')">Link to the help function</a>
     * %
     * %  Required input arguments:
     * %
     * %    y:         Response variable. Vector. A vector with n elements that
     * %               contains the response
     * %               variable.  It can be either a row or a column vector.
     * %    X :        Predictor variables. Matrix. Data matrix of explanatory
     * %               variables (also called 'regressors')
     * %               of dimension (n x p-1). Rows of X represent observations, and
     * %               columns represent variables.
     * %
     * %               Missing values (NaN's) and infinite values (Inf's) are
     * %               allowed, since observations (rows) with missing or infinite
     * %               values will automatically be excluded from the
     * %               computations.
     * %
     * %  Optional input arguments:
     * %
     * %   intercept :  Indicator for constant term. Scalar.
     * %               If 1, a model with constant term will be fitted (default),
     * %               else no constant term will be included.
     * %               Example - 'intercept',1 
     * %               Data Types - double
     * %           h : The number of observations that have determined the least
     * %                 trimmed squares estimator. Scalar. 
     * %               The number of observations that have determined the least
     * %               trimmed squares estimator. h is an integer greater than p
     * %               (number of columns of matrix X including the intercept but
     * %               smaller then n. If the purpose is outlier detection than h
     * %               does not have to be smaller than [0.5*(n+p+1)] (default
     * %               value). On the other hand if the purpose is to find
     * %               subgroups of homogeneous observations h can be smaller than
     * %               [0.5*(n+p+1)]. If h <p+1 an error will be given.
     * %                 Example - 'h',round(n*0,75) 
     * %                 Data Types - double
     * %         bdp :  breakdown point. Scalar.
     * %               It measures the fraction of outliers
     * %               the algorithm should
     * %               resist. In this case any value greater than 0 but smaller
     * %               or equal than 0.5 will do fine. If on the other hand the
     * %               purpose is subgroups detection then bdp can be greater than
     * %               0.5. In any case however n*(1-bdp) must be greater than
     * %               p. If this condition is not fulfilled an error will be
     * %               given. Please specify h or bdp not both.
     * %                 Example - 'bdp',0.4
     * %                 Data Types - double
     * %       nsamp : Number of subsamples which will be extracted to find the
     * %               robust estimator. Scalar.
     * %               If nsamp=0 all subsets will be extracted. They will be (n choose 
     * p).         
     * %                 Example - 'nsamp',0
     * %                 Data Types - double
     * %               Remark: if the number of all possible subset is <1000 the
     * %               default is to extract all subsets, otherwise just 1000 if
     * %               fastLTS is used (lms=2 or lms is a structure) or 3000 for
     * %               standard LTS or LMS.
     * %       lms   : Criterion to use to find the initlal
     * %                 subset to initialize the search. Scalar, vector or structure.
     * %               If lms is a scalar = 1 (default) Least Median of Squares is
     * %                       computed,
     * %               else if lms is a scalar = 2 fast lts with the all default options 
     * is used
     * %               else if lms is a scalar different from 1 and 2 standard lts
     * %                       is used (without concentration steps)
     * %               else if lms is a struct fast lts (with concentration steps) is 
     * used.
     * %                  In this case the user can control the following options:
     * %                  lms.refsteps : scalar defining number of refining iterations in 
     * each
     * %                               subsample (default = 3). refsteps = 0 means
     * %                               "raw-subsampling" without iterations. 
     * %                   lms.reftol  : scalar. Default value of tolerance for the 
     * refining steps
     * %                               The default value is 1e-6.
     * %                   lms.bestr   : scalar defining number of "best betas" to 
     * remember from the
     * %                               subsamples. These will be later iterated until 
     * convergence
     * %                               (default=5).
     * %             lms.refstepsbestr : scalar defining number of refining iterations 
     * for each
     * %                               best subset (default = 50).
     * %              lms.reftolbestr  : scalar. Default value of tolerance for the 
     * refining steps
     * %                               for each of the best subsets
     * %                               The default value is 1e-8.
     * %                 Example - 'lms',1 
     * %                 Data Types - double
     * %       rew   : LXS reweighted. Scalar. 
     * %                If rew=1 the reweighted version of LTS (LMS) is
     * %               used and the output quantities refer to the reweighted
     * %               version
     * %               else no reweighting is performed (default).
     * %                 Example - 'rew',1 
     * %                 Data Types - double
     * %     conflev :  Confidence level which is
     * %               used to declare units as outliers. Scalar
     * %               Usually conflev=0.95, 0.975 0.99 (individual alpha)
     * %               or 1-0.05/n, 1-0.025/n, 1-0.01/n (simultaneous alpha).
     * %               Default value is 0.975
     * %                 Example - 'conflev',0.99
     * %                 Data Types - double
     * %       plots : Plot on the screen. Scalar or structure.
     * %               If plots = 1, a plot which shows the
     * %               robust residuals against index number is shown on the
     * %               screen. The confidence level which is used to draw the
     * %               horizontal lines associated with the bands for the
     * %               residuals is as specified in input option conflev. If
     * %               conflev is missing a nominal 0.975 confidence interval will
     * %               be used.
     * %                 Example - 'plots',1 
     * %                 Data Types - double
     * %        msg  : It controls whether to display or not messages on the screen. 
     * Scalar.
     * %                If msg==1 (default) messages are displayed
     * %               on the screen about estimated time to compute the estimator
     * %               and the warnings about
     * %               'MATLAB:rankDeficientMatrix', 'MATLAB:singularMatrix' and
     * %               'MATLAB:nearlySingularMatrix' are set to off
     * %               else no message is displayed on the screen
     * %               Example - 'msg',1 
     * %               Data Types - double
     * %      nocheck: Check input arguments. Scalar. If nocheck is equal to 1 no check 
     * is performed on
     * %               matrix y and matrix X. Notice that y and X are left
     * %               unchanged. In other words the additioanl column of ones for
     * %               the intercept is not added. As default nocheck=0. The
     * %               controls on h, bdp and nsamp still remain.
     * %               Example - 'nocheck',1 
     * %               Data Types - double
     * %        nomes:  It controls whether to display or not on the screen
     * %               messages about estimated  time to compute LMS (LTS) . Scalar.
     * %               If nomes is equal to 1 no message about estimated
     * %               time to compute LMS (LTS) is displayed, else if nomes is
     * %               equal to 0 (default), a message about estimated time is
     * %               displayed.
     * %               Example - 'nomes',1 
     * %               Data Types - double
     * %       yxsave : the response vector y and data matrix X are saved into the output
     * %                structure out. Scalar.
     * %               Default is 0, i.e. no saving is done.
     * %               Example - 'yxsave',1 
     * %               Data Types - double
     * %
     * %
     * %       Remark: The user should only give the input arguments that have to
     * %               change their default value. The name of the input arguments
     * %               needs to be followed by their value. The order of the input
     * %               arguments is of no importance.
     * %
     * %
     * %  Output:
     * %
     * %  out :     A structure containing the following fields
     * %
     * %            out.rew  = Scalar if out.rew=1 all subsequent output refers to
     * %                       reweighted else no reweighting is done.
     * %            out.beta = Vector of beta LTS (LMS) coefficient estimates,
     * %                       including the intercept when options.intercept=1.
     * %                       out.beta=[intercept slopes].
     * %              out.bs = p x 1 vector containing the units forming subset
     * %                       associated with bLMS (bLTS).
     * %       out.residuals = Vector containing the standardized residuals from
     * %                       the regression.
     * %           out.scale = Scale estimate of the residuals.
     * %         out.weights = Vector like y containing weights. The elements of
     * %                       this vector are 0 or 1.
     * %                       These weights identify the h observations which are
     * %                       used to compute the final LTS (LMS) estimate.
     * %                       sum(out.weights)=h if there is not a perfect fit
     * %                       otherwise sum(out.weights) can be greater than h
     * %               out.h = The number of observations that have determined the
     * %                       LTS (LMS) estimator, i.e. the value of h.
     * %        out.outliers = vector containing the list of the units declared
     * %                       as outliers using confidence level specified in
     * %                       input scalar conflev
     * %         out.conflev = confidence level which is used to declare outliers.
     * %                       Remark: scalar out.conflev will be used
     * %                       to draw the horizontal lines (confidence bands) in the 
     * plots
     * %         out.singsub = Number of subsets wihtout full rank. Notice that if
     * %                       this number is greater than 0.1*(number of
     * %                       subsamples) a warning is produced on the screen
     * %           out.class = 'LTS' or 'LMS'.
     * %            out.y    = response vector Y. The field is present if option
     * %                       yxsave is set to 1.
     * %            out.X    = data matrix X. The field is present if option
     * %                       yxsave is set to 1.
     * %
     * %  Optional Output:
     * %
     * %            C        : Indexes of the extracted subsamples. Matrix.
     * %                       Matrix containing the indexes of the subsamples 
     * %                       extracted for computing the estimate (the so called
     * %                       elemental sets). For example, if C(3,:)=[2 5 20],
     * %                       implies that the third extracted subsample is
     * %                       formed by units 2, 5 and 20.
     * %
     * %
     * % See also FSReda, Sreg, MMreg
     * %
     * % References:
     * %
     * %   Rousseeuw PJ, Leroy AM (1987): Robust regression and outlier detection,
     * %   Wiley.
     * %
     * % Copyright 2008-2016.
     * % Written by FSDA team
     * %
     * %
     * %<a href="matlab: docsearchFS('LXS')">Link to the help function</a>
     * % Last modified 14-06-2016
     * </pre>
     *
     * @param nargout Number of outputs to return.
     * @param rhs The inputs to the M function.
     *
     * @return Array of length nargout containing the function outputs. Outputs are 
     * returned as sub-classes of <code>com.mathworks.toolbox.javabuilder.MWArray</code>. 
     * Each output array should be freed by calling its <code>dispose()</code> method.
     *
     * @throws java.jmi.RemoteException An error has occurred during the function call or 
     * in communication with the server.
     */
    public Object[] LXS(int nargout, Object... rhs) throws RemoteException;
    /**
     * Provides the standard interface for calling the <code>mdrplot</code> M-function 
     * with 2 input arguments.  
     *
     * Input arguments to standard interface methods may be passed as sub-classes of 
     * <code>com.mathworks.toolbox.javabuilder.MWArray</code>, or as arrays of any 
     * supported Java type (i.e. scalars and multidimensional arrays of any numeric, 
     * boolean, or character type, or String). Arguments passed as Java types are 
     * converted to MATLAB arrays according to default conversion rules.
     *
     * All inputs to this method must implement either Serializable (pass-by-value) or 
     * Remote (pass-by-reference) as per the RMI specification.
     *
     * M-documentation as provided by the author of the M function:
     * <pre>
     * %mdrplot plots the trajectory of minimum deletion residual (mdr)
     * %
     * %<a href="matlab: docsearchFS('mdrplot')">Link to the help function</a>
     * %
     * % Required input arguments:
     * %
     * %  out :  Structure containing monitoring of mdr. Structure. 
     * %               Structure containing the following fields.
     * %    out.mdr =  minimum deletion residual. A matrix containing the monitoring of 
     * minimum deletion
     * %               residual in each step of the forward search. The first
     * %               column of mdr must contain the fwd search index
     * %               This matrix can be created using function FSReda
     * %               (compulsory argument)
     * %       out.Un  =   order of entry of each unit. Matrix containing the order of 
     * entry of each unit
     * %               (necessary if datatooltip is true or databrush is not empty)
     * %       out.y   =   response. Vector containing the response (necessary only if
     * %               option databrush is not empty)
     * %       out.X   =   Regressors. A matrix containing the explanatory variables
     * %               (necessary only if option databrush is not empty)
     * %     out.Bols  =   Monitoring of beta coefficients. (n-init+1) x (p+1) matrix 
     * containing the monitoring of
     * %               estimated beta coefficients in each step of the forward search
     * %               (necessary only if option databrush is not empty and
     * %               suboption multivarfit is not empty)
     * %                Data Types - single|double
     * %
     * %
     * % Optional input arguments:
     * %
     * %       quant   :   Quantiles for which envelopes have
     * %                   to be computed. Vector. The default is to produce 1%, 50% and
     * %                   99% envelopes. In other words the default is
     * %                   quant=[0.01;0.5;0.99];
     * %                   Example - 'quant',[0.05;0.5;0.95]
     * %                   Data Types - double
     * %       exact:      Exact of approximate cdf for envelope calculation. Scalar. If 
     * it is equal to 1 the calculation of the
     * %                   quantiles of the T and F distribution is based on
     * %                   functions finv and tinv from the Matlab statistics
     * %                   toolbox, otherwise the calculations of the former
     * %                   quantiles is based on functions invcdff and invcdft.
     * %                   The solution has a tolerance of 1e-8 (change variable
     * %                   tol in files invcdff.m and invcdft.m if required.
     * %                   Example - 'exact',1
     * %                   Data Types - double
     * %                   Remark: the use of functions tinv and finv is more
     * %                   precise but requires more time. The default value of
     * %                   exact is 0 (approximate solution).
     * %       sign    :   mdr with sign. Scalar. If it is equal 1 (default) we 
     * distinguish steps
     * %                   for which minimum deletion residual was associated with
     * %                   positive or negative value of the residual. Steps
     * %                   associated with positive values of mdr are plotted in
     * %                   black, while other steps are plotted in red
     * %                   Example - 'sign',1
     * %                   Data Types - double
     * %       mplus1  :   plot of (m+1)th order statistic. Scalar. Scalar, which 
     * specifies if it is necessary to plot the
     * %                   curve associated with (m+1)th order statistic
     * %                   Example - 'mplus1',1
     * %                   Data Types - double
     * %       envm    :   sample size for drawing enevlopes. Scalar. Scalar which 
     * specifies the size of the sample which is
     * %                   used to superimpose the envelope. The default is to add
     * %                   an envelope based on all the observations (size n
     * %                   envelope).
     * %                   Example - 'envm',100
     * %                   Data Types - double
     * %       xlimx   :   min and max for x axis. Vector. vector with two elements 
     * controlling minimum and
     * %                   maximum on the x axis. Default value is mdr(1,1)-3 and
     * %                   mdr(end,1)*1.3
     * %                   Example - 'xlimx',[20 100]
     * %                   Data Types - double
     * %       ylimy   :   min and max for x axis. Vector. Vector with two elements 
     * controlling minimum and
     * %                   maximum on the y axis. Default value is min(mdr(:,2))
     * %                   and max(mdr(:,2));
     * %                   Example - 'ylimy',[2 6]
     * %                   Data Types - double
     * %       lwdenv  :   Line width. Scalar. Scalar which controls the width of the 
     * lines associated
     * %                   with the envelopes. Default is lwdenv=1
     * %                   Example - 'lwdenv',2
     * %                   Data Types - double
     * %       tag     :   plot handle. String. String which identifies the handle of the 
     * plot which
     * %                   is about to be created. The default is to use tag
     * %                   'pl_mdr'. Notice that if the program finds a plot which
     * %                   has a tag equal to the one specified by the user, then
     * %                   the output of the new plot overwrites the existing one
     * %                   in the same window else a new window is created
     * %                   Example - 'tag','mymdr'
     * %                   Data Types - char 
     * %   datatooltip :   interactive clicking. Empty value (default) or
     * %                   structure. 
     * %                   If datatooltip is not empty the user can use the mouse
     * %                   in order to have information about the unit selected,
     * %                   the step in which the unit enters the search and the
     * %                   associated label. If datatooltip is a structure, it is
     * %                   possible to control the aspect of the data cursor (see
     * %                   function datacursormode for more details or the
     * %                   examples below). The default options of the structure
     * %                   are DisplayStyle='Window' and SnapToDataVertex='on'
     * %                   Example - 'datatooltip',''
     * %                   Data Types - empty value, numeric or structure
     * %       label   :   row labels. Cell of strings. Cell containing the labels
     * %                   of the units (optional argument used when
     * %                   datatooltip=1. If this field is not present labels
     * %                   row1, ..., rown will be automatically created and
     * %                   included in the pop up datatooltip window)
     * %                   Example - 'label',{'Smith','Johnson','Robert','Stallone'}
     * %                   Data Types - cell 
     * %    databrush :    interactive mouse brushing. Empty value (default),
     * %                   scalar or structure.
     * %                   DATABRUSH IS AN EMPTY VALUE. 
     * %                   If databrush is an empty
     * %                   value (default), no brushing is done. The activation of
     * %                   this option (databrush is a scalar or a structure) enables
     * %                   the user  to select a set of trajectories in the
     * %                   current plot and to see them highlighted in the y|X
     * %                   plot (notice that if the plot y|X does not exist it is
     * %                   automatically created). In addition, brushed units can
     * %                   be highlighted in the monitoring residual plot
     * %                   The window style of the
     * %                   other figures is set equal to that which contains the
     * %                   monitoring residual plot. In other words, if the
     * %                   monitoring residual plot is docked all the other
     * %                   figures will be docked too.
     * %                  DATABRUSH IS A SCALAR.
     * %                   If databrush is a scalar the default selection tool is a
     * %                   rectangular brush and it is possible to brush only once
     * %                   (that is persist='').
     * %                  DATABRUSH IS A STRUCTURE. 
     * %                   If databrush is a structure, it is
     * %                   possible to use all optional arguments
     * %                   of function selectdataFS.m and the following optional
     * %                   argument:
     * %                  persist. Persist is an empty value or a scalar
     * %                   containing the strings 'on' or 'off' If persist = 'on'
     * %                   or 'off' brusing can be done as many time as the user
     * %                   requires. If persist='on' then the unit(s) currently
     * %                   brushed are added to those previously brushed. If
     * %                   persist='off' every time a new brush is performed units
     * %                   previously brushed are removed. The default value of
     * %                   persist is '' that is brushing is allowed only once. If
     * %                   persist is 'on' it is possible, every time a new
     * %                   brushing is done, to use a different color for the
     * %                   brushed units
     * %                  bivarfit. This option is to add one or more least
     * %                     square lines to the plots of y|X, depending on the
     * %                     selected groups. bivarfit = ''
     * %                       is the default: no line is fitted.
     * %                     bivarfit = '1'
     * %                       fits a single ols line to all points of each
     * %                       bivariate plot in the scatter matrix y|X.
     * %                     bivarfit = '2'
     * %                       fits two ols lines: one to all points and another
     * %                       to the last selected group. This is useful when
     * %                       there are only two groups, of which one refers to a
     * %                       set of potential outliers.
     * %                     bivarfit = '0'
     * %                       fits one ols line for each selected group. This is
     * %                       useful for the purpose of fitting mixtures of
     * %                       regression lines.
     * %                     bivarfit = 'i1' or 'i2' or 'i3' etc.
     * %                       fits a ols line to a specific group, the one with
     * %                       index 'i' equal to 1, 2, 3 etc.
     * %                   multivarfit. If this option is '1', we add to each scatter
     * %                     plot of y|X a line based on the fitted hyperplane
     * %                     coefficients. The line added to the scatter plot y|Xi
     * %                     is mean(y)+Ci*Xi, being Ci the coefficient of Xi. The
     * %                     default value of multivarfit is '', i.e. no line is
     * %                     added.
     * %                   labeladd. If this option is '1', we label the units
     * %                     of the last selected group with the unit row index in
     * %                     matrices X and y. The default value is labeladd='',
     * %                     i.e. no label is added.
     * %                   Example - 'databrush',1
     * %                   Data Types - single | double | struct 
     * %       FontSize:   Size of axes labels. Scalar. Scalar which controls the
     * %                   fontsize of the labels of the axes. Default value is 12
     * %                   Example - 'FontSize',14
     * %                   Data Types - single | double
     * %    SizeAxesNum:   Size of axes numbers. Scalar which controls the fontsize of 
     * the numbers of
     * %                   the axes. Default value is 10
     * %                   Example - 'SizeAxesNum',14
     * %                   Data Types - single | double
     * %       nameX   :   Regressors names. Cell array of strings. Cell array of strings 
     * of length p containing the labels
     * %                   of the varibles of the regression dataset. If it is empty
     * %                 	(default) the sequence X1, ..., Xp will be created
     * %                   automatically
     * %                   Example - 'nameX',{'Age','Income','Married','Profession'}
     * %                   Data Types - cell 
     * %       namey   :   response label. Character. Character containing the label of 
     * the response
     * %                   Example - 'namey','response label'
     * %                   Data Types - char 
     * %       lwd     :   Curves line width. Scalar. Scalar which controls linewidth of 
     * the curve which
     * %                   contains the monitoring of minimum deletion residual.
     * %                   Default line width=2
     * %                   Example - 'lwd',3
     * %                   Data Types - single | double 
     * %       titl    :   main title. Character. A label for the title (default: '')
     * %                   Example - 'namey','Plot title'
     * %                   Data Types - char 
     * %       labx    :   x axis title. Character. A label for the x-axis (default: 
     * 'Subset size m')
     * %                   Example - 'labx','Subset size m'
     * %                   Data Types - char 
     * %       laby    :   y axis title. Character. A label for the y-axis (default: 
     * 'Minimum deletion residual')
     * %                   Example - 'laby','mdr'
     * %                   Data Types - char 
     * %
     * %
     * %
     * %
     * % Output: 
     * %
     * % See also: resfwdplot
     * %
     * % References:
     * %
     * %   Atkinson and Riani (2000), Robust Diagnostic Regression Analysis,
     * %   Springer Verlag, New York.
     * %
     * % Copyright 2008-2016.
     * % Written by FSDA team
     * %
     * %
     * %<a href="matlab: docsearchFS('mdrplot')">Link to the help function</a>
     * % Last modified 01-06-2016
     * </pre>
     *
     * @param rhs The inputs to the M function.
     *
     * @return Array of length nargout containing the function outputs. Outputs are 
     * returned as sub-classes of <code>com.mathworks.toolbox.javabuilder.MWArray</code>. 
     * Each output array should be freed by calling its <code>dispose()</code> method.
     *
     * @throws java.jmi.RemoteException An error has occurred during the function call or 
     * in communication with the server.
     */
    public Object[] mdrplot(Object... rhs) throws RemoteException;
    /**
     * Provides the standard interface for calling the <code>MMreg</code> M-function with 
     * 3 input arguments.  
     *
     * Input arguments to standard interface methods may be passed as sub-classes of 
     * <code>com.mathworks.toolbox.javabuilder.MWArray</code>, or as arrays of any 
     * supported Java type (i.e. scalars and multidimensional arrays of any numeric, 
     * boolean, or character type, or String). Arguments passed as Java types are 
     * converted to MATLAB arrays according to default conversion rules.
     *
     * All inputs to this method must implement either Serializable (pass-by-value) or 
     * Remote (pass-by-reference) as per the RMI specification.
     *
     * M-documentation as provided by the author of the M function:
     * <pre>
     * %MMreg computes MM estimator of regression coefficients
     * %
     * %<a href="matlab: docsearchFS('MMreg')">Link to the help function</a>
     * %
     * %  Required input arguments:
     * %
     * %    y: Response variable. Vector. A vector with n elements that contains
     * %       the response variable. y can be either a row or a column vector.
     * %    X: Data matrix of explanatory variables (also called 'regressors') of
     * %       dimension (n x p-1). Rows of X represent observations, and columns
     * %       represent variables.
     * %       Missing values (NaN's) and infinite values (Inf's) are allowed,
     * %       since observations (rows) with missing or infinite values will
     * %       automatically be excluded from the computations.
     * %
     * %  Optional input arguments:
     * %
     * %  intercept :  Indicator for constant term. Scalar. If 1, a model with
     * %               constant term will be fitted (default), else no constant
     * %               term will be included.
     * %               Example - 'intercept',1
     * %               Data Types - double
     * %  InitialEst : starting values of the MM-estimator. [] (default) or structure.
     * %               InitialEst must contain the following fields
     * %               InitialEst.loc =  v x 1 vector (estimate of the centroid)
     * %               InitialEst.scale = scalar (estimate of the scale parameter).
     * %               If InitialEst is empty (default)
     * %               program uses S estimators. In this last case it is
     * %               possible to specify the options given in function Sreg.
     * %               Example - 'InitialEst',[]
     * %               Data Types - struct
     * %  Soptions  :  options to pass to Sreg. Name value pairs. 
     * %               Options if initial estimator is S and InitialEst is empty.
     * %               The options are: Srhofunc,Snsamp,Srefsteps, Sreftol, 
     * Srefstepsbestr,
     * %               Sreftolbestr, Sminsctol, Sbestr.
     * %               See function Sreg.m for more details on these options.
     * %               It is necessary to add to the S options the letter
     * %               S at the beginning. For example, if you want to use the
     * %               optimal rho function the supplied option is
     * %               'Srhofunc','optimal'. For example, if you want to use 3000
     * %               subsets, the supplied option is 'Snsamp',3000
     * %               Example - 'Snsamp',1000
     * %               Data Types - single | double
     * %
     * %
     * %               MM options
     * %
     * %      eff     : nominal efficiency. Scalar.
     * %                Scalar defining nominal efficiency (i.e. a number between
     * %                 0.5 and 0.99). The default value is 0.95
     * %                 Asymptotic nominal efficiency is:
     * %                 $(\\int \\psi' d\\Phi)^2 / (\\psi^2 d\\Phi)$
     * %                 Example - 'eff',0.99
     * %                 Data Types - double
     * %     effshape : location or scale effiicency. dummy scalar.
     * %                If effshape=1 efficiency refers to shape
     * %                efficiency else (default) efficiency refers to location
     * %                 Example - 'effshape',1
     * %                 Data Types - double
     * %     rhofunc : rho function. String. String which specifies the rho function 
     * which must be used to
     * %               weight the residuals. Possible values are
     * %               'bisquare'
     * %               'optimal'
     * %               'hyperbolic'
     * %               'hampel'
     * %               'bisquare' uses Tukey's $\\rho$ and $\\psi$ functions.
     * %               See TBrho and TBpsi
     * %               'optimal' uses optimal $\\rho$ and $\\psi$ functions.
     * %               See OPTrho and OPTpsi
     * %               'hyperbolic' uses hyperbolic $\\rho$ and $\\psi$ functions.
     * %               See HYPrho and HYPpsi
     * %               'hampel' uses Hampel $\\rho$ and $\\psi$ functions.
     * %               See HArho and HApsi
     * %               The default is bisquare
     * %                 Example - 'rhofunc','optimal'
     * %                 Data Types - char
     * % rhofuncparam: Additional parameters for the specified rho function.
     * %               Scalar or vector.
     * %               For hyperbolic rho function it is possible to set up the
     * %               value of k = sup CVC (the default value of k is 4.5).
     * %               For Hampel rho function it is possible to define parameters
     * %               a, b and c (the default values are a=2, b=4, c=8)
     * %                 Example - 'rhofuncparam',5
     * %                 Data Types - single | double
     * %     refsteps  : Maximum iterations. Scalar.
     * %                 Scalar defining maximum number of iterations in the MM
     * %                 loop. Default value is 100.
     * %                 Example - 'refsteps',10
     * %                 Data Types - double
     * %       tol    : Tolerance. Scalar.
     * %                 Scalar controlling tolerance in the MM loop.
     * %                 Default value is 1e-7
     * %                 Example - 'tol',1e-10
     * %                 Data Types - double
     * %     conflev :  Confidence level which is
     * %               used to declare units as outliers. Scalar.
     * %               Usually conflev=0.95, 0.975 0.99 (individual alpha)
     * %               or 1-0.05/n, 1-0.025/n, 1-0.01/n (simultaneous alpha).
     * %               Default value is 0.975
     * %                 Example - 'conflev',0.99
     * %                 Data Types - double
     * %       nocheck : Check input arguments. Scalar. If nocheck is equal to 1 no check 
     * is performed on
     * %                 matrix y and matrix X. Notice that y and X are left
     * %                 unchanged. In other words the additional column of ones
     * %                 for the intercept is not added. As default nocheck=0.
     * %               Example - 'nocheck',1
     * %               Data Types - double
     * %       plots : Plot on the screen. Scalar or structure.
     * %               If plots = 1, generates a plot with the robust residuals
     * %               against index number. The confidence level used to draw the
     * %               confidence bands for the residuals is given by the input
     * %               option conflev. If conflev is not specified a nominal 0.975
     * %               confidence interval will be used.
     * %                 Example - 'plots',0
     * %                 Data Types - single | double
     * %       yxsave : the response vector y and data matrix X are saved into the output
     * %                structure out. Scalar.
     * %               Default is 0, i.e. no saving is done.
     * %               Example - 'yxsave',1
     * %               Data Types - double
     * %       msg    :  Level of output to display. Scalar. It controls whether
     * %                 to display or not messages on the screen
     * %                 If msg==1 (default) messages are displayed on the screen about
     * %                   step in which signal took place
     * %                 else no message is displayed on the screen.
     * %               Example - 'msg',1
     * %               Data Types - double
     * %
     * %  Output:
     * %
     * %
     * %  out :     A structure containing the following fields:
     * %       out.beta        =   p x 1 vector containing MM estimate of
     * %                           regression coefficients.
     * %       out.auxscale    =   scalar, S estimate of the scale (or supplied
     * %                           external estimate of scale, if option InitialEst
     * %                           is not empty).
     * %       out.residuals	=   n x 1 vector containing standardized MM
     * %                           residuals.
     * %      out.fittedvalues =   n x 1 vector containing the fitted values.
     * %                           out.residuals=(y-X*out.beta)/out.auxscale
     * %       out.weights     =   n x 1 vector. Weights assigned to each observation
     * %       out.Sbeta       :   p x 1 vector containing S estimate of regression
     * %                           coefficients (or supplied initial external
     * %                           estimate of regression coefficients, if option
     * %                           InitialEst is not empty)
     * %       out.Ssingsub    =   Number of subsets without full rank in the S
     * %                           preliminary part. Notice that
     * %                           out.singsub > 0.1*(number of subsamples)
     * %                           produces a warning
     * %       out.outliers    :   1 x k vectors containing the outliers which
     * %                           have been found
     * %       out.conflev     =   Confidence level that was used to declare outliers
     * %           out.rhofunc =   string identifying the rho function which has been
     * %                           used. If a different rho function is specified
     * %                           for S and MM loop then insted of out.rhofunc we
     * %                           will have out.rhofuncS and out.rhofuncMM.
     * %      out.rhofuncparam =   vector which contains the additional parameters
     * %                           for the specified rho function which have been
     * %                           used. For hyperbolic rho function the value of
     * %                           k =sup CVC. For Hampel rho function the parameters
     * %                           a, b and c. If a different rho function is
     * %                           specified for S and MM loop then insted of
     * %                           out.rhofuncparam we will have out.rhofuncparamS
     * %                           and out.rhofuncparamMM.
     * %            out.y      =   response vector Y. The field is present if option
     * %                           yxsave is set to 1.
     * %            out.X      =   data matrix X. The field is present if option
     * %                           yxsave is set to 1.
     * %       out.class       =   'MMreg'
     * %
     * %
     * %  Optional Output:
     * %
     * %            C        : matrix containing the indices of the subsamples
     * %                       extracted for computing the estimate (the so called
     * %                       elemental sets).
     * %
     * %
     * % See also: Sreg
     * %
     * % References:
     * %
     * % Maronna, R.A., Martin D. and Yohai V.J. (2006),Robust Statistics, Theory
     * % and Methods, Wiley,New York.
     * %
     * % Acknowledgements:
     * %
     * % This function follows the lines of MATLAB/R code developed during the
     * % years by many authors.
     * % For more details see http://www.econ.kuleuven.be/public/NDBAE06/programs/
     * % and the R library robustbase http://robustbase.r-forge.r-project.org/
     * % The core of these routines, e.g. the resampling approach, however, has
     * % been completely redesigned, with considerable increase of the
     * % computational performance.
     * %
     * % Copyright 2008-2016.
     * % Written by FSDA team
     * %
     * %
     * %<a href="matlab: docsearchFS('MMreg')">Link to the help page for this function</a>
     * % Last modified 31-05-2016
     * </pre>
     *
     * @param nargout Number of outputs to return.
     * @param rhs The inputs to the M function.
     *
     * @return Array of length nargout containing the function outputs. Outputs are 
     * returned as sub-classes of <code>com.mathworks.toolbox.javabuilder.MWArray</code>. 
     * Each output array should be freed by calling its <code>dispose()</code> method.
     *
     * @throws java.jmi.RemoteException An error has occurred during the function call or 
     * in communication with the server.
     */
    public Object[] MMreg(int nargout, Object... rhs) throws RemoteException;
    /**
     * Provides the standard interface for calling the <code>MMregcore</code> M-function 
     * with 5 input arguments.  
     *
     * Input arguments to standard interface methods may be passed as sub-classes of 
     * <code>com.mathworks.toolbox.javabuilder.MWArray</code>, or as arrays of any 
     * supported Java type (i.e. scalars and multidimensional arrays of any numeric, 
     * boolean, or character type, or String). Arguments passed as Java types are 
     * converted to MATLAB arrays according to default conversion rules.
     *
     * All inputs to this method must implement either Serializable (pass-by-value) or 
     * Remote (pass-by-reference) as per the RMI specification.
     *
     * M-documentation as provided by the author of the M function:
     * <pre>
     * %MMregcore computes MM regression estimators for a selected fixed scale.
     * %
     * %<a href="matlab: docsearchFS('MMregcore')">Link to the help function</a>
     * %
     * %  Required input arguments:
     * %
     * %    y: Response variable. Vector. A vector with n elements that contains
     * %       the response variable. y can be either a row or a column vector.
     * %    X: Data matrix of explanatory variables (also called 'regressors') of
     * %       dimension (n x p-1). Rows of X represent observations, and columns
     * %       represent variables.
     * %       Missing values (NaN's) and infinite values (Inf's) are allowed,
     * %       since observations (rows) with missing or infinite values will
     * %       automatically be excluded from the computations.
     * %    b0:        Initial estimate of beta. Vector. Vector containing initial
     * %               estimate of beta (generally an S estimate with high
     * %               breakdown point (e.g. 0.5)
     * % auxscale:     scale estimate. Scalar.
     * %               Scalar containing estimate of the scale (generally an S
     * %               estimate with high breakdown point (e.g. .5)
     * %
     * %  Optional input arguments:
     * %
     * %  intercept :  Indicator for constant term. Scalar. If 1, a model with
     * %               constant term will be fitted (default), else no constant
     * %               term will be included.
     * %               Example - 'intercept',1 
     * %               Data Types - double
     * %      eff     : nominal efficiency. Scalar.
     * %                Scalar defining nominal efficiency (i.e. a number between
     * %                 0.5 and 0.99). The default value is 0.95
     * %                 Asymptotic nominal efficiency is:
     * %                 $(\\int \\psi' d\\Phi)^2 / (\\psi^2 d\\Phi)$
     * %                 Example - 'eff',0.99
     * %                 Data Types - double
     * %     effshape : locacation or scale effiicency. dummy scalar. 
     * %                If effshape=1 efficiency refers to shape 
     * %                efficiency else (default) efficiency refers to location
     * %                 Example - 'effshape',1
     * %                 Data Types - double
     * %     refsteps  : Maximum iterations. Scalar.
     * %                 Scalar defining maximum number of iterations in the MM
     * %                 loop. Default value is 100.
     * %                 Example - 'refsteps',10
     * %                 Data Types - double
     * %      reftol: Tolerance. Scalar.
     * %                 Scalar controlling tolerance in the MM loop.
     * %                 Default value is 1e-7
     * %                 Example - 'tol',1e-10
     * %                 Data Types - double
     * %     conflev :  Confidence level which is
     * %               used to declare units as outliers. Scalar.
     * %               Usually conflev=0.95, 0.975 0.99 (individual alpha)
     * %               or 1-0.05/n, 1-0.025/n, 1-0.01/n (simultaneous alpha).
     * %               Default value is 0.975
     * %                 Example - 'conflev',0.99
     * %                 Data Types - double
     * %     rhofunc : rho function. String. String which specifies the rho function 
     * which must be used to
     * %               weight the residuals. Possible values are
     * %               'bisquare'
     * %               'optimal'
     * %               'hyperbolic'
     * %               'hampel'
     * %               'bisquare' uses Tukey's $\\rho$ and $\\psi$ functions.
     * %               See TBrho and TBpsi
     * %               'optimal' uses optimal $\\rho$ and $\\psi$ functions.
     * %               See OPTrho and OPTpsi
     * %               'hyperbolic' uses hyperbolic $\\rho$ and $\\psi$ functions.
     * %               See HYPrho and HYPpsi
     * %               'hampel' uses Hampel $\\rho$ and $\\psi$ functions.
     * %               See HArho and HApsi
     * %               The default is bisquare
     * %                 Example - 'rhofunc','optimal' 
     * %                 Data Types - char
     * % rhofuncparam: Additional parameters for the specified rho function.
     * %               Scalar or vector.
     * %               For hyperbolic rho function it is possible to set up the
     * %               value of k = sup CVC (the default value of k is 4.5).
     * %               For Hampel rho function it is possible to define parameters
     * %               a, b and c (the default values are a=2, b=4, c=8)
     * %                 Example - 'rhofuncparam',5 
     * %                 Data Types - single | double
     * %       nocheck : Check input arguments. Scalar. If nocheck is equal to 1 no check 
     * is performed on
     * %                 matrix y and matrix X. Notice that y and X are left
     * %                 unchanged. In other words the additional column of ones
     * %                 for the intercept is not added. As default nocheck=0.
     * %               Example - 'nocheck',1 
     * %               Data Types - double
     * %       plots : Plot on the screen. Scalar or structure.
     * %               If plots = 1, generates a plot with the robust residuals
     * %               against index number. The confidence level used to draw the
     * %               confidence bands for the residuals is given by the input
     * %               option conflev. If conflev is not specified a nominal 0.975
     * %               confidence interval will be used.
     * %                 Example - 'plots',0 
     * %                 Data Types - single | double
     * %       yxsave : the response vector y and data matrix X are saved into the output
     * %                structure out. Scalar.
     * %               Default is 0, i.e. no saving is done.
     * %               Example - 'yxsave',1 
     * %               Data Types - double
     * %
     * %  Output:
     * %
     * %      out :     A structure containing the following fields
     * %
     * %       out.beta  = p x 1 vector. Estimate of beta coefficients after 
     * %                   refsteps refining steps
     * %   out.residuals = n x 1 vector containing the estimates of the robust
     * %                   scaled residuals
     * %   out.outliers  = A vector containing the list of the units declared as
     * %                   outliers using confidence level specified in input
     * %                   scalar conflev
     * %   out.conflev   = Confidence level that was used to declare outliers
     * %   out.weights   = n x 1 vector. Weights assigned to each observation
     * %     out.rhofunc = string identifying the rho function which has been
     * %                   used. 
     * % out.rhofuncparam= vector which contains the additional parameters
     * %                   for the specified rho function which have been
     * %                   used. For hyperbolic rho function the value of
     * %                   k =sup CVC. For Hampel rho function the parameters
     * %                   a, b and c. 
     * %     out.y       = response vector y. The field is present if option 
     * %                   yxsave is set to 1.
     * %     out.X       = data matrix X. The field is present if option 
     * %                   yxsave is set to 1.
     * %     out.class   = 'MMreg'
     * %
     * %
     * % More About:
     * %
     * % It does iterative reweighted least squares (IRWLS) steps from "initial
     * % beta" (b0) keeping the estimate of the scale (auxscale) fixed.
     * %
     * % See also: Sreg
     * %
     * % References:
     * %
     * % Maronna, R.A., Martin D. and Yohai V.J. (2006),Robust Statistics, Theory
     * % and Methods, Wiley, New York.
     * %
     * % Acknowledgements:
     * %
     * % This function follows the lines of MATLAB/R code developed during the
     * % years by many authors.
     * % For more details see http://www.econ.kuleuven.be/public/NDBAE06/programs/
     * % and the R library robustbase http://robustbase.r-forge.r-project.org/.
     * % The core of these routines, e.g. the resampling approach, however, has
     * % been completely redesigned, with considerable increase of the
     * % computational performance.
     * %
     * % Copyright 2008-2016.
     * % Written by FSDA team
     * %
     * %
     * %<a href="matlab: docsearchFS('MMregcore')">Link to the help page for this 
     * function</a>
     * % Last modified 31-05-2016
     * </pre>
     *
     * @param nargout Number of outputs to return.
     * @param rhs The inputs to the M function.
     *
     * @return Array of length nargout containing the function outputs. Outputs are 
     * returned as sub-classes of <code>com.mathworks.toolbox.javabuilder.MWArray</code>. 
     * Each output array should be freed by calling its <code>dispose()</code> method.
     *
     * @throws java.jmi.RemoteException An error has occurred during the function call or 
     * in communication with the server.
     */
    public Object[] MMregcore(int nargout, Object... rhs) throws RemoteException;
    /**
     * Provides the standard interface for calling the <code>MMregeda</code> M-function 
     * with 3 input arguments.  
     *
     * Input arguments to standard interface methods may be passed as sub-classes of 
     * <code>com.mathworks.toolbox.javabuilder.MWArray</code>, or as arrays of any 
     * supported Java type (i.e. scalars and multidimensional arrays of any numeric, 
     * boolean, or character type, or String). Arguments passed as Java types are 
     * converted to MATLAB arrays according to default conversion rules.
     *
     * All inputs to this method must implement either Serializable (pass-by-value) or 
     * Remote (pass-by-reference) as per the RMI specification.
     *
     * M-documentation as provided by the author of the M function:
     * <pre>
     * %MMregeda computes MM estimator in linear regression for a series of values of 
     * efficiency
     * %
     * %
     * %<a href="matlab: docsearchFS('MMregeda')">Link to the help function</a>
     * %
     * %  Required input arguments:
     * %
     * %    y: Response variable. Vector. A vector with n elements that contains
     * %       the response variable. y can be either a row or a column vector.
     * %    X: Data matrix of explanatory variables (also called 'regressors') of
     * %       dimension (n x p-1). Rows of X represent observations, and columns
     * %       represent variables.
     * %       Missing values (NaN's) and infinite values (Inf's) are allowed,
     * %       since observations (rows) with missing or infinite values will
     * %       automatically be excluded from the computations.
     * %
     * %  Optional input arguments:
     * %
     * %  intercept :  Indicator for constant term. Scalar. If 1, a model with
     * %               constant term will be fitted (default), else no constant
     * %               term will be included.
     * %               Example - 'intercept',1
     * %               Data Types - double
     * %  InitialEst : starting values of the MM-estimator. [] (default) or structure.
     * %               InitialEst must contain the following fields
     * %               InitialEst.loc =  v x 1 vector (estimate of the centroid)
     * %               InitialEst.scale = scalar (estimate of the scale parameter).
     * %               If InitialEst is empty (default)
     * %               program uses S estimators. In this last case it is
     * %               possible to specify the options given in function Sreg.
     * %               Example - 'InitialEst',[]
     * %               Data Types - struct
     * %  Soptions  :  options if initial estimator is S and InitialEst is empty.
     * %               Srhofunc,Snsamp,Srefsteps, Sreftol, Srefstepsbestr,
     * %               Sreftolbestr, Sminsctol, Sbestr.
     * %               See function Sreg.m for more details on these options.
     * %               It is necessary to add to the S options the letter
     * %               S at the beginning. For example, if you want to use the
     * %               optimal rho function the supplied option is
     * %               'Srhofunc','optimal'. For example, if you want to use 3000
     * %               subsets, the supplied option is 'Snsamp',3000
     * %               Example - 'Snsamp',1000
     * %               Data Types - single | double
     * %
     * %
     * %               MM options
     * %
     * %      eff     : nominal efficiency. Scalar or vector.
     * %                Vector defining nominal efficiency (i.e. a series of numbers 
     * between
     * %                 0.5 and 0.99). The default value is the sequence 0.5:0.01:0.99
     * %                 Asymptotic nominal efficiency is:
     * %                 $(\\int \\psi' d\\Phi)^2 / (\\psi^2 d\\Phi)$
     * %                 Example - 'eff',[0.85 0.90 0.95 0.99]
     * %                 Data Types - double
     * %     effshape : location or scale effiicency. dummy scalar.
     * %                If effshape=1 efficiency refers to shape
     * %                efficiency else (default) efficiency refers to location
     * %                 Example - 'effshape',1
     * %                 Data Types - double
     * %     refsteps  : Maximum iterations. Scalar.
     * %                 Scalar defining maximum number of iterations in the MM
     * %                 loop. Default value is 100.
     * %                 Example - 'refsteps',10
     * %                 Data Types - double
     * %       tol    : Tolerance. Scalar.
     * %                 Scalar controlling tolerance in the MM loop.
     * %                 Default value is 1e-7
     * %                 Example - 'tol',1e-10
     * %                 Data Types - double
     * %     conflev :  Confidence level which is
     * %               used to declare units as outliers. Scalar.
     * %               Usually conflev=0.95, 0.975 0.99 (individual alpha)
     * %               or 1-0.05/n, 1-0.025/n, 1-0.01/n (simultaneous alpha).
     * %               Default value is 0.975
     * %                 Example - 'conflev',0.99
     * %                 Data Types - double
     * %       nocheck : Check input arguments. Scalar. If nocheck is equal to 1 no check 
     * is performed on
     * %                 matrix y and matrix X. Notice that y and X are left
     * %                 unchanged. In other words the additional column of ones
     * %                 for the intercept is not added. As default nocheck=0.
     * %               Example - 'nocheck',1
     * %               Data Types - double
     * %       plots : Plot on the screen. Scalar or structure.
     * %               If plots = 1, generates a plot with the robust residuals
     * %               against index number. The confidence level used to draw the
     * %               confidence bands for the residuals is given by the input
     * %               option conflev. If conflev is not specified a nominal 0.975
     * %               confidence interval will be used.
     * %                 Example - 'plots',0
     * %                 Data Types - single | double
     * %
     * %  Output:
     * %
     * %
     * %  out :     A structure containing the following fields
     * %       out.auxscale    =   scalar, S estimate of the scale (or supplied
     * %                           external estimate of scale, if option InitialEst
     * %                           is not empty)
     * %       out.Beta        =   p x length(eff) matrix containing MM estimate of
     * %                           regression coefficients for each value of eff
     * %       out.RES	=   n x length(eff) matrix containing scaled MM
     * %                           residuals for each value of eff
     * %                           out.RES(:,jj)=(y-X*out.Beta(:,jj))/out.auxscale
     * %       out.Weights     =   n x length(eff) matrix. Weights assigned to
     * %                           each observation for each value of eff
     * %       out.Outliers    :   n x length(eff) Boolean matrix containing the
     * %                           outliers which have been found for each value
     * %                           of eff.
     * %       out.Sbeta       :   p x 1 vector containing S estimate of regression
     * %                           coefficients (or supplied initial external
     * %                           estimate of regression coefficients, if option
     * %                           InitialEst is not empty)
     * %       out.Ssingsub    =   Number of subsets without full rank in the S
     * %                           preliminary part. Notice that
     * %                           out.singsub > 0.1*(number of subsamples)
     * %                           produces a warning
     * </pre>
     *
     * @param nargout Number of outputs to return.
     * @param rhs The inputs to the M function.
     *
     * @return Array of length nargout containing the function outputs. Outputs are 
     * returned as sub-classes of <code>com.mathworks.toolbox.javabuilder.MWArray</code>. 
     * Each output array should be freed by calling its <code>dispose()</code> method.
     *
     * @throws java.jmi.RemoteException An error has occurred during the function call or 
     * in communication with the server.
     */
    public Object[] MMregeda(int nargout, Object... rhs) throws RemoteException;
    /**
     * Provides the standard interface for calling the <code>resfwdplot</code> M-function 
     * with 2 input arguments.  
     *
     * Input arguments to standard interface methods may be passed as sub-classes of 
     * <code>com.mathworks.toolbox.javabuilder.MWArray</code>, or as arrays of any 
     * supported Java type (i.e. scalars and multidimensional arrays of any numeric, 
     * boolean, or character type, or String). Arguments passed as Java types are 
     * converted to MATLAB arrays according to default conversion rules.
     *
     * All inputs to this method must implement either Serializable (pass-by-value) or 
     * Remote (pass-by-reference) as per the RMI specification.
     *
     * M-documentation as provided by the author of the M function:
     * <pre>
     * %resfwdplot plots the trajectories of the monitored scaled (squared) residuals
     * %
     * %
     * %<a href="matlab: docsearchFS('resfwdplot')">Link to the help function</a>
     * %
     * %  Required input arguments:
     * %
     * %  out :  Structure containing monitoring of scaled residuals. Structure.
     * %               Structure containing the following fields.
     * %   out.RES =   matrix containing the residuals monitored in each step of
     * %               the forward search or any other robust procedure. Every row
     * %               is associated with a residual (unit). This matrix can be
     * %               created using function FSReda, Sregeda, MMregeda.
     * %   out.Un  =   matrix containing the order of entry in the subset of each
     * %               unit (required only when datatooltip is true or databrush
     * %               is not empty).
     * %     out.y  =   a vector containing the response (required only when option
     * %               databrush is not empty).
     * %     out.X  =   a matrix containing the explanatory variables (required only
     * %               when option databrush is not empty).
     * %   out.Bols =   (n-init+1) x (p+1) matrix containing the estimated beta
     * %               coefficients monitored in each step of the robust procedure
     * %               (required only when option databrush is not empty and
     * %               suboption multivarfit is not empty).
     * %                Data Types - single|double
     * %
     * %
     * %  Optional input arguments:
     * %
     * %           standard : appearance of the plot
     * %                   in terms of xlim, ylim, axes labels and their font size
     * %                   style, color of the lines, etc. Structure.
     * %                   Structure standard contains the following fields
     * %                   standard.SizeAxesNum  = scalar specifying the fontsize of the
     * %                       axes numbers. Default value is 10.
     * %                   standard.xlim = two elements vector with minimum and maximum of
     * %                       the x axis. Default value is '' (automatic scale).
     * %                   standard.ylim = two elements vector with minimum and maximum of
     * %                       the y axis. Default value is '' (automatic scale).
     * %                   standard.titl = a label for the title (default: '').
     * %                   standard.labx = a label for the x-axis (default: 'Subset size 
     * m').
     * %                   standard.laby = a label for the y-axis (default:'Scaled 
     * residuals'
     * %                       or 'Scaled squared residuals').
     * %                  standard. SizeAxesLab = Scalar specifying the fontsize of the
     * %                       labels of the axes. Default value is 12.
     * %                   standard.xvalues = vector. x axis values.
     * %                       Numeric vector of length(size(out.RES,2)) controlling the x
     * %                       axis coordinates. The default value of xvalues is
     * %                       size(out.RES,1)-size(out.RES,2)+1:size(out.RES,1)
     * %                   standard.LineWidth = scalar specifying line width for the
     * %                       trajectories.
     * %                   standard.Color = cell array of strings containing the colors to
     * %                       be used for the highlighted units.
     * %                       If length(Color)=1 the same color will be used for
     * %                       all units.
     * %                       If length(Color)=2 half of the trajectories will
     * %                       appear with Color{1} and the other half with
     * %                       Color{2}. And so on with 3 cell elements, etc.
     * %                   standard.LineStyle = cell containing the line types.
     * %
     * %                   The default values of structure standard are:
     * %                   standard.SizeAxesNum=10
     * %                   standard.SizeAxesLab=12
     * %                   standard.xlim='' (Automatic scale)
     * %                   standard.ylim='' (Automatic scale)
     * %                   standard.titl='' (empty title)
     * %                   standard.labx='Subset size m'
     * %                   standard.laby='Scaled residuals'
     * %                   standard.LineWidth=1
     * %                   standard.Color={'b'}
     * %                   standard.LineStyle={'-'}
     * %                   
     * standard.xvalues=size(out.RES,1)-size(out.RES,2)+1:size(out.RES,1)
     * %                   Example - 'standard.LineWidth','1'
     * %                   Data Types - struct
     * %
     * %         fground : trajectories in foregroud.
     * %                   Structure. Structure which controls which trajectories
     * %                   are highlighted and how
     * %                   they are plotted to be distinguishable from the others.
     * %                   It is possible to control the label, the width, the
     * %                   color, the line type and the marker of the highlighted
     * %                   units. The structure fground contains the following
     * %                   fields:
     * %                   fground.fthresh = (alternative to funit) numeric vector of
     * %                       length 1 or 2 which specifies the highlighted
     * %                       trajectories.
     * %                       If length(fthresh)=1 the highlighted trajectories
     * %                       are those of units that throughtout the search had
     * %                       at leat once a residual greater (in absolute value)
     * %                       than thresh. The default value of fthresh is 2.5.
     * %                       If length(fthresh)=2 the highlighted trajectories
     * %                       are those of units that throughtout the search had
     * %                       a residual at leat once bigger than fthresh(2) or
     * %                       smaller than fthresh(1).
     * %                   fground.funit = (alternative to fthresh) vector containing the
     * %                       list of the units to be highlighted. If funit is
     * %                       supplied, fthresh is ignored.
     * %                   fground.flabstep = numeric vector which specifies the steps of
     * %                       the search where to put labels for the highlighted
     * %                       trajectories (units). The default is to put the
     * %                       labels at the initial and final steps of the search.
     * %                       flabstep='' means no label.
     * %                   fground.LineWidth = scalar specifying line width for the
     * %                       highlighted trajectories (units). Default is 1.
     * %                   fground.Color = cell array of strings containing the colors to
     * %                       be used for the highlighted trajectories (units).
     * %                       If length(scolor)==1 the same color will be used for
     * %                       all highlighted units Remark: if for example
     * %                       length(scolor)=2 and there are 6 highlighted units,
     * %                       3 highlighted trajectories appear with
     * %                       selunitcolor{1} and 3 highlighted trajectories with
     * %                       selunitcolor{2}
     * %                   fground.LineStyle = cell containing the line type of the 
     * highlighted
     * %                       trajectories.
     * %                   fground.fmark  = scalar controlling whether to plot highlighted
     * %                       trajectories as markers.
     * %                       if 1 each line is plotted using a different marker
     * %                       else no marker is used (default).
     * %                fground.FontSize = scalar controlling font size of the labels of
     * %                       the trajectories in foreground.
     * %
     * %                   The default values of structure fground are:
     * %                    fground.fthresh=2.5
     * %                    fground.flabstep=[m0 n]
     * %                    fground.LineWidth=1
     * %                    fground.LineStyle={'-'}
     * %                    fground.FontSize=12
     * %
     * %                   Example - 'fground.LineWidth','1'
     * %                   Data Types - struct
     * %                   Remark: if fground='' no unit is highlighted and no
     * %                   label is inserted into the plot.
     * %
     * %         bground : characterictics of the trajectories in background.
     * %                   Structure.
     * %                    Structure which specifies the trajectories in background,
     * %                   i.e. the trajectories corresponding to "unimmportant"
     * %                   units in the central part of the data. The structure
     * %                   also specifies the style used in the plot to give them
     * %                   less emphasis, so that to not distract the eye of the
     * %                   analyst from the trajectories of the relevant units.
     * %                   The structure contains the following fields:
     * %                   bground.bthresh = numeric vector of length 1 or 2 which
     * %                       specifies how to define the unimmportant trajectories.
     * %                       Unimmportant trajectories will be plotted using a
     * %                       colormap, in greysh or will be hidden.
     * %                       - If length(thresh)=1 the irrelevant units are
     * %                         those which always had a residual smaller
     * %                         (in absolute value) than thresh.
     * %                       - If length(bthresh)=2 the irrelevant units
     * %                         are those which always had a residual greater
     * %                         than bthresh(1) and smaller than bthresh(2).
     * %                       The default is:
     * %                           bthresh=2.5 if n>100 and bthresh=-inf if n<=100
     * %                       i.e. to treat all trajectories as important if
     * %                       n<=100 and, if n>100, to reduce emphasis only to
     * %                       trajectories having in all steps of the search a
     * %                       value of scaled residual smaller than 2.5.
     * %                   bground.bstyle = specifies how to plot the unimportant
     * %                       trajectories as defined in option bthresh.
     * %                       'faint': unimportant trajectories are plotted using
     * %                           a colormap.
     * %                       'hide': unimportant trajectories are hidden.
     * %                       'greysh': unimportant trajectories are displayed in
     * %                           a faint grey.
     * %                       When n>100 the default option is 'faint'.
     * %                       When n<=100 and bthresh = -Inf option bstyle is
     * %                       ignored.
     * %                   Example - 'bground.bstyle','faint'
     * %                   Data Types - struct
     * %                   Remark: bground='' is equivalent to bground.thresh=-Inf
     * %                   that is all trajectories are considered relevant.
     * %
     * %       tag     :    Personalized plot tag. String. String which identifies
     * %                   the handle of the plot which
     * %                   is about to be created. The default is to use tag
     * %                   'pl_resfwd'. Note that if the program finds a plot which
     * %                   has a tag equal to the one specified by the user, then
     * %                   the output of the new plot overwrites the existing one
     * %                   in the same window else a new window is created.
     * %                   Example - 'tag','myplot'
     * %                   Data Types - char
     * %   datatooltip :   interactive clicking. Empty value, scalar or
     * %                   structure.
     * %                   It is inactive if it is an empty value. The default is
     * %                   datatooltip = 1, i.e. the user can select with the
     * %                   mouse an individual residual trajectory in order to
     * %                   have information about the corresponding unit. The
     * %                   information displayed depends on the estimator in use.
     * %                   For example for class FSReda the information concerns
     * %                   the label and the step of the search in which the unit
     * %                   enters the subset. If datatooltip is a
     * %                   structure it may contain the following fields
     * %                   datatooltip.DisplayStyle = determines how the data cursor 
     * displays.
     * %                       Possible values are 'datatip' and 'window'
     * %                       (default).
     * %                       'datatip' displays data cursor information in a
     * %                       small yellow text box attached to a black square
     * %                       marker at a data point you interactively select.
     * %                       'window' displays data cursor information for the
     * %                       data point you interactively select in a floating
     * %                       window within the figure.
     * %                   datatooltip.SnapToDataVertex = specifies whether the
     * %                       data cursor snaps to the nearest data value or is
     * %                       located at the actual pointer position. Possible
     * %                       values are 'on' (default) and 'off'.
     * %                   datatooltip.LineColor = controls the color of the
     * %                       trajectory selected with the mouse. It can be an
     * %                       RGB triplet of values between 0 and 1, or character
     * %                       vector indicating a color name. Note that a RGB
     * %                       vector can be conveniently chosen with our MATLAB
     * %                       class FSColor, see documentation.
     * %                   datatooltip.SubsetLinesColor = enables to control the
     * %                       color of the trajectories of the units that are in
     * %                       the subset at a given step of the search (if
     * %                       resfwdplot is applied to an object of class
     * %                       FSReda) or have a weight greater than 0.9 (if
     * %                       resfwdplot is applied to an object of class LXSeda,
     * %                       Sregeda and MMregeda).
     * %                       This can be done (repeatedly) with a left mouse
     * %                       click in proximity of the step of interest. A right
     * %                       mouse click will terminate the selection by marking
     * %                       with a up-arrow the step corresponding to the
     * %                       highlighted lines. The highlighted lines by default
     * %                       are in red, but a different color can be specified
     * %                       as RGB triplet or character of color name.
     * %                       Note that a RGB vector can be conveniently chosen with
     * %                       our MATLAB class FSColor, see documentation.
     * %                       By default SubsetLinesColor ='', i.e. the modality
     * %                       is not active.
     * %                       Any initialization for SubsetLinesColor which
     * %                       cannot be interpreted as RGB vector will be
     * %                       converted to blue, i.e. SubsetLinesColor will be
     * %                       forced to be [0 0 1].
     * %                       If SubsetLinesColor is not empty previous option
     * %                       LineColor is overlooked.
     * %                   Example - 'datatooltip',''
     * %                   Data Types - empty value, scalar or struct
     * %       label   :   row labels. Cell of strings.
     * %                   Cell containing the labels of the units (optional
     * %                   argument used when datatooltip=1. If this field is not
     * %                   present labels row1, ..., rown will be automatically
     * %                   created and included in the pop up datatooltip window)
     * %                   Example - 'label',{'Smith','Johnson','Robert','Stallone'}
     * %                   Data Types - cell
     * %    databrush  :   interactive mouse brushing. Empty value, scalar or structure.
     * %                   If databrush is an empty value (default), no brushing
     * %                   is done.
     * %                   The activation of this option (databrush is a scalar or
     * %                   a cell) enables the user  to select a set of
     * %                   trajectories in the current plot and to see them
     * %                   highlighted in the y|X plot, i.e. a matrix of scatter
     * %                   plots of y against each column of X, grouped according
     * %                   to the selection(s) done by brushing. If the plot y|X
     * %                   does not exist it is automatically created.
     * %                   In addition, brushed units are automatically highlighted in the
     * %                   minimum deletion residual plot if it is already open.
     * %                   The extension to the following plots will be available
     * %                   in future versions of the toolbox:
     * %                   - monitoring leverage plot;
     * %                   - maximum studentized residual;
     * %                   - s^2 and R^2;
     * %                   - Cook distance and modified Cook distance;
     * %                   - deletion t statistics.
     * %                   Note that the window style of the other figures is set
     * %                   equal to that which contains the monitoring residual
     * %                   plot. In other words, if the monitoring residual plot
     * %                   is docked all the other figures will be docked too
     * %                   DATABRUSH IS A SCALAR
     * %                   If databrush is a scalar the default selection tool is
     * %                   a rectangular brush and it is possible to brush only
     * %                   once (that is persist='').
     * %                   DATABRUSH IS A STRUCTURE.
     * %                   If databrush is a structure, it is possible to use all
     * %                   optional arguments of function selectdataFS.m and the
     * %                   following optional argument:
     * %                   - persist. Persist is an empty value or a scalar
     * %                     containing the strings 'on' or 'off'.
     * %                     The default value of persist is '', that is brushing
     * %                     is allowed only once.
     * %                     If persist is 'on' or 'off' brushing can be done as
     * %                     many time as the user requires.
     * %                     If persist='on' then the unit(s) currently brushed
     * %                     are added to those previously brushed. it is
     * %                     possible, every time a new brushing is done, to use a
     * %                     different color for the brushed units.
     * %                     If persist='off' every time a new brush is performed
     * %                     units previously brushed are removed.
     * %                   - bivarfit. This option adds one or more least
     * %                     square lines based on SIMPLE REGRESSION to the plots
     * %                     of y|X, depending on the selected groups.
     * %                     bivarfit = ''
     * %                       is the default: no line is fitted.
     * %                     bivarfit = '1'
     * %                       fits a single ols line to all points of each
     * %                       bivariate plot in the scatter matrix y|X.
     * %                     bivarfit = '2'
     * %                       fits two ols lines: one to all points and another
     * %                       to the last selected group. This is useful when
     * %                       there are only two groups, of which one refers to a
     * %                       set of potential outliers.
     * %                     bivarfit = '0'
     * %                       fits one ols line for each selected group. This is
     * %                       useful for the purpose of fitting mixtures of
     * %                       regression lines.
     * %                     bivarfit = 'i1' or 'i2' or 'i3' etc.
     * %                       fits a ols line to a specific group, the one with
     * %                       index 'i' equal to 1, 2, 3 etc.
     * %                   - multivarfit: This option adds one or more least square
     * %                       lines, based on MULTIVARIATE REGRESSION of y on X,
     * %                       to the plots of y|Xi.
     * %                     multivarfit = ''
     * %                       is the default: no line is fitted.
     * %                     multivarfit = '1'
     * %                       fits a single ols line to all points of each
     * %                       bivariate plot in the scatter matrix y|X.
     * %                       The line added to the scatter plot y|Xi
     * %                       is avconst +Ci*Xi, where Ci is the
     * %                       coefficient of Xi in the multivariate regression
     * %                       and avconst is the effect of all the other
     * %                       explanatory variables different from Xi evaluated
     * %                       at their centroid (that is $\\overline{y}'C$)).
     * %                     multivarfit = '2'
     * %                       exactly equal to multivarfit ='1' but this time we
     * %                       add the line based on the group of unselected
     * %                       observations.
     * %                   - labeladd. If this option is '1', we label the units
     * %                     of the last selected group with the unit row index in
     * %                     matrices X and y. The default value is labeladd='',
     * %                     i.e. no label is added.
     * %                   Example - 'databrush',1
     * %                   Data Types - single | double | struct
     * %       nameX   :  labels of the explanatory variables. Cell. Cell array of
     * %                   strings of length p containing the labels
     * %                   of the variables of the regression dataset. If it is
     * %                   empty the sequence X1, ..., Xp will be created
     * %                   automatically
     * %                   Example - 'nameX',{'var1', var2, 'var3'}
     * %                   Data Types - cell of strings
     * %       namey   :   response label. Character. Character containing the label of 
     * the response
     * %                   Example - 'namey','response'
     * %                   Data Types - character
     * %       msg     :   display  used options. Scalar.
     * %                   Scalar which controls whether to display
     * %                   as output the options inside structures standard,
     * %                   fground and bground which have been used to draw the
     * %                   plot.
     * %                   plotopt=resfwdplot(out,'msg',1) prints on the screen
     * %                   the options which have been used to draw
     * %                   the three types of trajectories (standard, foreground
     * %                   and background).
     * %                   Example - 'msg',1
     * %                   Data Types - single or double
     * %
     * % Output:
     * %
     * %   plotopt : options which have been used to create the plot. Cell array
     * %               of strings. Store all options which have been used to
     * %               generate the plot inside cell plotopt.
     * %
     * % See also: malfwdplot
     * %
     * % References:
     * %
     * %   Atkinson and Riani (2000), Robust Diagnostic Regression Analysis,
     * %   Springer Verlag, New York.
     * %
     * % Copyright 2008-2016.
     * % Written by FSDA team
     * %
     * %
     * %<a href="matlab: docsearchFS('resfwdplot')">Link to the help function</a>
     * % Last modified 11-06-2016
     * </pre>
     *
     * @param nargout Number of outputs to return.
     * @param rhs The inputs to the M function.
     *
     * @return Array of length nargout containing the function outputs. Outputs are 
     * returned as sub-classes of <code>com.mathworks.toolbox.javabuilder.MWArray</code>. 
     * Each output array should be freed by calling its <code>dispose()</code> method.
     *
     * @throws java.jmi.RemoteException An error has occurred during the function call or 
     * in communication with the server.
     */
    public Object[] resfwdplot(int nargout, Object... rhs) throws RemoteException;
    /**
     * Provides the standard interface for calling the <code>resindexplot</code> 
     * M-function with 2 input arguments.  
     *
     * Input arguments to standard interface methods may be passed as sub-classes of 
     * <code>com.mathworks.toolbox.javabuilder.MWArray</code>, or as arrays of any 
     * supported Java type (i.e. scalars and multidimensional arrays of any numeric, 
     * boolean, or character type, or String). Arguments passed as Java types are 
     * converted to MATLAB arrays according to default conversion rules.
     *
     * All inputs to this method must implement either Serializable (pass-by-value) or 
     * Remote (pass-by-reference) as per the RMI specification.
     *
     * M-documentation as provided by the author of the M function:
     * <pre>
     * %resindexplot plots the residuals from a regression analysis versus index number 
     * or any other variable
     * %
     * %
     * %<a href="matlab: docsearchFS('resindexplot')">Link to the help function</a>
     * %
     * % Required input arguments:
     * %
     * %  residuals :  residuals to plot. Numeric vector or structure. If
     * %               residuals is a vector it contains the n residuals.
     * %               If residuals is a structure it contains the following fields
     * %               residuals.residuals = vector of residuals (compulsory
     * %               field)
     * %               residuals.y = response (compulsory field if interactive
     * %               brushing is used)
     * %               residuals.X = n-by-p matrix containing explanatory
     * %               variables(compulsory field if interactive
     * %               brushing is used)
     * %                Data Types - single|double
     * %
     * % Optional input arguments:
     * %               h : the axis handle of a figure where to send the resindexplot.
     * %                   This can be used to host the resindexplot in a subplot of a
     * %                   complex figure formed by different panels (for example a panel
     * %                   with residuals from a classical ols estimator and another
     * %                   with residuals from a robust regression: see example
     * %                   below).
     * %                   Example -'h',h1 where h1=subplot(2,1,1)
     * %                   Data Types - Axes object (supplied as a scalar) 
     * %              x :  the vector to be plotted on the x-axis. Numeric vector.
     * %                   As default the sequence 1:length(residuals) will be
     * %                   used
     * %                   Example -'x',1:100
     * %                   Data Types - double
     * %           labx :  a label for the x-axis. Character.  (default: '')
     * %                   Example -'labx','row index'
     * %                   Data Types - char
     * %           laby :  a label for the y-axis.  Character.  (default: '')
     * %                   Example -'laby','scaled residuals'
     * %                   Data Types - char
     * %          title :  a label containing the title of the plot.  Character. Default 
     * value is
     * %                   'Index plot of residuals'
     * %                   Example -'title','scaled residuals'
     * %                   Data Types - char
     * %          numlab:  number of points to be identified in plots. 
     * %                   [] | cell ({5} default) | numeric vector.
     * %                   If numlab is a cell containing scalar k, the units
     * %                   with the k largest residuals are labelled in the plots.
     * %                   If numlab is a vector, the units inside vector numlab are
     * %                   labelled in the plots.
     * %                   The default value of numlab is {5}. that is units with the 5
     * %                   largest residuals are labelled.
     * %                   For no labelling leave it empty
     * %                   Example -'numlab',[3,10,35]
     * %                   Data Types - double
     * %        conflev :  confidence interval for the horizontal bands. Numeric
     * %                   vector.
     * %                   It can be a vector of different confidence level
     * %                   values.
     * %                   Example -'conflev',[0.95,0.99,0.999]
     * %                   Data Types - double
     * %                   Remark: confidence interval is based on the chi^2 distribution
     * %        FontSize:  Scalar which controls the fontsize of the labels of the
     * %                   axes. Default value is 12.
     * %                   Example -'Fontsize',10
     * %                   Data Types - double
     * %     SizeAxesNum:  Scalar which controls the fontsize of the numbers of
     * %                   the axes. Default value is 10.
     * %                   Example -'SizeAxesNum',10
     * %                   Data Types - double
     * %           ylimy:  Vector with two elements which controla minimum and maximum
     * %                   value of the y axis. Default is '', automatic scale.
     * %                   Example -'SizeAxesNum',10
     * %                   Data Types - double
     * %           xlimx:  Vector with two elements controlling minimum and maximum
     * %                   on the x axis. Default value is '' (automatic scale).
     * %                   Example -'SizeAxesNum',10
     * %                   Data Types - double
     * %          lwdenv:  width of the lines associated
     * %                   with the envelopes. Scalar. Default is lwdenv=1.
     * %                   Example -'SizeAxesNum',10
     * %                   Data Types - double
     * %      MarkerSize:  size of the marker in points. Scalar.
     * %                   The default value for MarkerSize is 6 points (1 point =
     * %                   1/72 inch).
     * %                   Example -'SizeAxesNum',10
     * %                   Data Types - double
     * % MarkerFaceColor:  Marker fill color.
     * %                   'none' | 'auto' | RGB triplet | color string. 
     * %                   Fill color for markers that are closed shapes
     * %                   (circle, square, diamond, pentagram, hexagram, and the
     * %                   four triangles).
     * %                   Example -'MarkerFaceColor','b'
     * %                   Data Types - char
     * %    databrush  :   interactive mouse brushing. Empty value, scalar or structure.
     * %                   If databrush is an empty value (default), no brushing
     * %                   is done.
     * %                   The activation of this option (databrush is a scalar or
     * %                   a cell) enables the user  to select a set of
     * %                   trajectories in the current plot and to see them
     * %                   highlighted in the y|X plot, i.e. a matrix of scatter
     * %                   plots of y against each column of X, grouped according
     * %                   to the selection(s) done by brushing. If the plot y|X
     * %                   does not exist, it is automatically created.
     * %                   Please, note that the window style of the other figures is set
     * %                   equal to that which contains the monitoring residual
     * %                   plot. In other words, if the monitoring residual plot
     * %                   is docked all the other figures will be docked too
     * %                   DATABRUSH IS A SCALAR.
     * %                   If databrush is a scalar the default selection tool is
     * %                   a rectangular brush and it is possible to brush only
     * %                   once (that is persist='').
     * %                   DATABRUSH IS A STRUCTURE.
     * %                   If databrush is a structure, it is possible to use all
     * %                   optional arguments of function selectdataFS.m and the
     * %                   following fields
     * %                   - databrush.persist = repeated brushng enabled. Persist is an 
     * empty value or a scalar
     * %                     containing the strings 'on' or 'off'.
     * %                     The default value of persist is '', that is brushing
     * %                     is allowed only once.
     * %                     If persist is 'on' or 'off' brushing can be done as
     * %                     many time as the user requires.
     * %                     If persist='on' then the unit(s) currently brushed
     * %                     are added to those previously brushed. it is
     * %                     possible, every time a new brushing is done, to use a
     * %                     different color for the brushed units.
     * %                     If persist='off' every time a new brush is performed
     * %                     units previously brushed are removed.
     * %                   - databrush.labeladd = add labels of brushed units.
     * %                     Character. [] (default) | '1'. 
     * %                     If databrush.labeladd='1', we label the units
     * %                     of the last selected group with the unit row index in
     * %                     matrices X and y. The default value is labeladd='',
     * %                     i.e. no label is added.
     * %                   - databrush.bivarfit = this option adds one or more least
     * %                     square lines based on SIMPLE REGRESSION to the plots
     * %                     of y|X, depending on the selected groups.
     * %                     bivarfit = ''
     * %                       is the default: no line is fitted.
     * %                     bivarfit = '1'
     * %                       fits a single ols line to all points of each
     * %                       bivariate plot in the scatter matrix y|X.
     * %                     bivarfit = '2'
     * %                       fits two ols lines: one to all points and another
     * %                       to the last selected group. This is useful when
     * %                       there are only two groups, of which one refers to a
     * %                       set of potential outliers.
     * %                     bivarfit = '0'
     * %                       fits one ols line for each selected group. This is
     * %                       useful for the purpose of fitting mixtures of
     * %                       regression lines.
     * %                     bivarfit = 'i1' or 'i2' or 'i3' etc.
     * %                       fits a ols line to a specific group, the one with
     * %                       index 'i' equal to 1, 2, 3 etc.
     * %                   - databrush. multivarfit = this option adds one or more least 
     * square
     * %                       lines, based on MULTIVARIATE REGRESSION of y on X,
     * %                       to the plots of y|Xi.
     * %                     multivarfit = ''
     * %                       is the default: no line is fitted.
     * %                     multivarfit = '1'
     * %                       fits a single ols line to all points of each
     * %                       bivariate plot in the scatter matrix y|X.
     * %                       The line added to the scatter plot y|Xi
     * %                       is avconst +Ci*Xi, where Ci is the
     * %                       coefficient of Xi in the multivariate regression
     * %                       and avconst is the effect of all the other
     * %                       explanatory variables different from Xi evaluated
     * %                       at their centroid (that is overline{y}'C))
     * %                     multivarfit = '2'
     * %                       exactly equal to multivarfit ='1' but this time we
     * %                       add the line based on the group of unselected
     * %                       observations.
     * %                   - databrush.labeladd = if this option is '1', we label the 
     * units
     * %                     of the last selected group with the unit row index in
     * %                     matrices X and y. The default value is labeladd='',
     * %                     i.e. no label is added.
     * %                   Example - 'databrush',1
     * %                   Data Types - single | double | struct 
     * %       nameX   :   regressor labels. Cell array of strings of length p containing 
     * the labels
     * %                   of the variables of the regression dataset. If it is
     * %                   empty (default) the sequence X1, ..., Xp will be created
     * %                   automatically
     * %                   Example - 'nameX',{'Age','Income','Married','Profession'}
     * %                   Data Types - cell 
     * %       namey   :   response label. Character. Character containing the
     * %                   label of the response. If it is
     * %                   empty (default) label 'y' will be used.
     * %                   Example - 'namey','response'
     * %                   Data Types - char
     * %           tag  :  Figure tag. Character.  
     * %                   Tag of the figure which will host the malindexplot. The
     * %                   default tag is pl_resindex
     * %                   Example - 'tag','indexPlot'
     * %                   Data Types - character
     * %
     * % Output: 
     * %
     * %
     * % See also resfwdplot.m
     * %
     * % References:
     * %
     * %   Rousseeuw PJ, Leroy AM (1987): Robust regression and outlier detection.
     * %   Wiley.
     * %
     * % Copyright 2008-2016.
     * % Written by FSDA team
     * %
     * %
     * %<a href="matlab: docsearchFS('resindexplot')">Link to the help function</a>
     * % Last modified 31-05-2016
     * </pre>
     *
     * @param rhs The inputs to the M function.
     *
     * @return Array of length nargout containing the function outputs. Outputs are 
     * returned as sub-classes of <code>com.mathworks.toolbox.javabuilder.MWArray</code>. 
     * Each output array should be freed by calling its <code>dispose()</code> method.
     *
     * @throws java.jmi.RemoteException An error has occurred during the function call or 
     * in communication with the server.
     */
    public Object[] resindexplot(Object... rhs) throws RemoteException;
    /**
     * Provides the standard interface for calling the <code>Score</code> M-function with 
     * 3 input arguments.  
     *
     * Input arguments to standard interface methods may be passed as sub-classes of 
     * <code>com.mathworks.toolbox.javabuilder.MWArray</code>, or as arrays of any 
     * supported Java type (i.e. scalars and multidimensional arrays of any numeric, 
     * boolean, or character type, or String). Arguments passed as Java types are 
     * converted to MATLAB arrays according to default conversion rules.
     *
     * All inputs to this method must implement either Serializable (pass-by-value) or 
     * Remote (pass-by-reference) as per the RMI specification.
     *
     * M-documentation as provided by the author of the M function:
     * <pre>
     * %Score computes the score test for transformation
     * %
     * %<a href="matlab: docsearchFS('Score')">Link to the help function</a>
     * %
     * %  Required input arguments:
     * %
     * %    y:         Response variable. Vector. A vector with n elements that
     * %               contains the response
     * %               variable.  It can be either a row or a column vector.
     * %    X :        Predictor variables. Matrix. Data matrix of explanatory
     * %               variables (also called 'regressors')
     * %               of dimension (n x p-1). Rows of X represent observations, and
     * %               columns represent variables.
     * %               Missing values (NaN's) and infinite values (Inf's) are allowed,
     * %               since observations (rows) with missing or infinite values will
     * %               automatically be excluded from the computations.
     * %
     * %  Optional input arguments:
     * %
     * %  intercept :  Indicator for constant term. Scalar. If 1, a model with
     * %               constant term will be fitted (default), else no constant
     * %               term will be included.
     * %               Example - 'intercept',1 
     * %               Data Types - double
     * %           la  :transformation parameter. Vector. It specifies for which values 
     * of the
     * %                 transformation parameter it is necessary to compute the
     * %                 score test. 
     * %                 Default value of lambda is la=[-1 -0.5 0 0.5 1]; that
     * %                 is the five most common values of lambda
     * %               Example - 'la',[0 0.5]
     * %               Data Types - double
     * %           Lik : likelihood for the augmented model. Scalar.
     * %                   If 1 the value of the likelihood for the augmented model will 
     * be produced
     * %                 else (default) only the value of the score test will be given
     * %               Example - 'Lik',0
     * %               Data Types - double
     * %       nocheck : Check input arguments. Scalar.
     * %               If nocheck is equal to 1 no check is performed on
     * %                 matrix y and matrix X. Notice that y and X are left
     * %                 unchanged. In other words the additional column of ones
     * %                 for the intercept is not added. As default nocheck=0.
     * %               Example - 'nocheck',1 
     * %               Data Types - double
     * %
     * %  Output:
     * %
     * %  The output consists of a structure 'outSC' containing the following fields:
     * %
     * %        outSC.Score    =    score test. Scalar. t test for additional
     * %                            constructed variable
     * %        outSC.Lik      =    value of the likelihood. Scalar. This output
     * %                           is produced just if input value Lik =1
     * %
     * % See also
     * % 
     * % FSRfan
     * %
     * % References:
     * %
     * % Atkinson A.C. and Riani M. (2000), equation (2.30) for the expression
     * % for score test statistic.
     * %
     * % Copyright 2008-2016.
     * % Written by FSDA team
     * %
     * %
     * %<a href="matlab: docsearchFS('Score')">Link to the help function</a>
     * % Last modified 31-05-2016
     * </pre>
     *
     * @param nargout Number of outputs to return.
     * @param rhs The inputs to the M function.
     *
     * @return Array of length nargout containing the function outputs. Outputs are 
     * returned as sub-classes of <code>com.mathworks.toolbox.javabuilder.MWArray</code>. 
     * Each output array should be freed by calling its <code>dispose()</code> method.
     *
     * @throws java.jmi.RemoteException An error has occurred during the function call or 
     * in communication with the server.
     */
    public Object[] Score(int nargout, Object... rhs) throws RemoteException;
    /**
     * Provides the standard interface for calling the <code>Sreg</code> M-function with 
     * 3 input arguments.  
     *
     * Input arguments to standard interface methods may be passed as sub-classes of 
     * <code>com.mathworks.toolbox.javabuilder.MWArray</code>, or as arrays of any 
     * supported Java type (i.e. scalars and multidimensional arrays of any numeric, 
     * boolean, or character type, or String). Arguments passed as Java types are 
     * converted to MATLAB arrays according to default conversion rules.
     *
     * All inputs to this method must implement either Serializable (pass-by-value) or 
     * Remote (pass-by-reference) as per the RMI specification.
     *
     * M-documentation as provided by the author of the M function:
     * <pre>
     * %Sreg computes S estimators in linear regression
     * %
     * %<a href="matlab: docsearchFS('Sreg')">Link to the help function</a>
     * %
     * %  Required input arguments:
     * %
     * %    y: Response variable. Vector. A vector with n elements that contains
     * %       the response variable. y can be either a row or a column vector.
     * %    X: Data matrix of explanatory variables (also called 'regressors') of
     * %       dimension (n x p-1). Rows of X represent observations, and columns
     * %       represent variables.
     * %       Missing values (NaN's) and infinite values (Inf's) are allowed,
     * %       since observations (rows) with missing or infinite values will
     * %       automatically be excluded from the computations.
     * %
     * %  Optional input arguments:
     * %
     * %  intercept :  Indicator for constant term. Scalar. If 1, a model with
     * %               constant term will be fitted (default), else no constant
     * %               term will be included.
     * %               Example - 'intercept',1 
     * %               Data Types - double
     * %         bdp :  breakdown point. Scalar.
     * %               It measures the fraction of outliers
     * %               the algorithm should resist. In this case any value greater
     * %               than 0 but smaller or equal than 0.5 will do fine.
     * %               Note that given bdp nominal
     * %               efficiency is automatically determined.
     * %                 Example - 'bdp',0.4
     * %                 Data Types - double
     * %     rhofunc : rho function. String. String which specifies the rho function 
     * which must be used to
     * %               weight the residuals. Possible values are
     * %               'bisquare'
     * %               'optimal'
     * %               'hyperbolic'
     * %               'hampel'.
     * %               'bisquare' uses Tukey's $\\rho$ and $\\psi$ functions.
     * %               See TBrho.m and TBpsi.m.
     * %               'optimal' uses optimal $\\rho$ and $\\psi$ functions.
     * %               See OPTrho.m and OPTpsi.m.
     * %               'hyperbolic' uses hyperbolic $\\rho$ and $\\psi$ functions.
     * %               See HYPrho.m and HYPpsi.m.
     * %               'hampel' uses Hampel $\\rho$ and $\\psi$ functions.
     * %               See HArho.m and HApsi.m.
     * %               The default is bisquare
     * %                 Example - 'rhofunc','optimal' 
     * %                 Data Types - double
     * % rhofuncparam: Additional parameters for the specified rho function.
     * %               Scalar or vector.
     * %               For hyperbolic rho function it is possible to set up the
     * %               value of k = sup CVC (the default value of k is 4.5).
     * %               For Hampel rho function it is possible to define parameters
     * %               a, b and c (the default values are a=2, b=4, c=8)
     * %                 Example - 'rhofuncparam',5 
     * %                 Data Types - single | double
     * %       nsamp   : Number of subsamples which will be extracted to find the
     * %                 robust estimator. Scalar. If nsamp=0 all subsets will be 
     * extracted.
     * %                 They will be (n choose p).
     * %                 If the number of all possible subset is <1000 the
     * %                 default is to extract all subsets otherwise just 1000.
     * %                 Example - 'nsamp',1000 
     * %                 Data Types - single | double
     * %    refsteps : Number of refining iterations. Scalar. Number of refining 
     * iterationsin each
     * %               subsample (default = 3).
     * %               refsteps = 0 means "raw-subsampling" without iterations.
     * %                 Example - 'refsteps',10 
     * %                 Data Types - single | double
     * %     reftol  : tolerance for the refining steps. Scalar. 
     * %               The default value is 1e-6;
     * %                 Example - 'reftol',1e-05 
     * %                 Data Types - single | double
     * %refstepsbestr: number of refining iterations for each best subset. Scalar.
     * %               Scalar defining number of refining iterations for each
     * %               best subset (default = 50).
     * %                 Example - 'refstepsbestr',10 
     * %                 Data Types - single | double
     * % reftolbestr : Tolerance for the refining steps. Scalar. 
     * %               Tolerance for the refining steps
     * %               for each of the best subsets
     * %               The default value is 1e-8;
     * %                 Example - 'reftolbestr',1e-10 
     * %                 Data Types - single | double
     * %     minsctol: tolerance for the iterative
     * %               procedure for finding the minimum value of the scale. Scalar. 
     * %               Value of tolerance for the iterative
     * %               procedure for finding the minimum value of the scale
     * %               for each subset and each of the best subsets
     * %               (It is used by subroutine minscale.m)
     * %               The default value is 1e-7;
     * %                 Example - 'minsctol',1e-7 
     * %                 Data Types - single | double
     * %      bestr  : number of "best betas" to remember. Scalar. Scalar defining number 
     * of "best betas" to remember from the
     * %               subsamples. These will be later iterated until convergence
     * %               (default=5)
     * %                 Example - 'bestr',10 
     * %                 Data Types - single | double
     * %     conflev :  Confidence level which is
     * %               used to declare units as outliers. Scalar
     * %               Usually conflev=0.95, 0.975 0.99 (individual alpha)
     * %               or 1-0.05/n, 1-0.025/n, 1-0.01/n (simultaneous alpha).
     * %               Default value is 0.975
     * %                 Example - 'conflev',0.99
     * %                 Data Types - double
     * %        msg  : Level of output to display. Scalar. It controls whether
     * %                 to display or not messages on the screen.
     * %               If msg==1 (default) messages are displayed
     * %               on the screen about estimated time to compute the estimator
     * %               and the warnings about
     * %               'MATLAB:rankDeficientMatrix', 'MATLAB:singularMatrix' and
     * %               'MATLAB:nearlySingularMatrix' are set to off
     * %               else no message is displayed on the screen
     * %                 Example - 'msg',0 
     * %                 Data Types - single | double
     * %       nocheck : Check input arguments. Scalar. If nocheck is equal to 1 no check 
     * is performed on
     * %                 matrix y and matrix X. Notice that y and X are left
     * %                 unchanged. In other words the additional column of ones
     * %                 for the intercept is not added. As default nocheck=0.
     * %               Example - 'nocheck',1 
     * %               Data Types - double
     * %       plots : Plot on the screen. Scalar.
     * %               If plots = 1, generates a plot with the robust residuals
     * %               against index number. The confidence level used to draw the
     * %               confidence bands for the residuals is given by the input
     * %               option conflev. If conflev is not specified a nominal 0.975
     * %               confidence interval will be used.
     * %                 Example - 'plots',0 
     * %                 Data Types - single | double
     * %       yxsave : save option. Scalar. if yxsave is equal to 1, the response
     * %               vector y and data matrix X are saved into the output
     * %               structure out. Default is 0, i.e. no saving is done.
     * %               Example - 'yxsave',1 
     * %               Data Types - double
     * %
     * %  Output:
     * %
     * %  out :     A structure containing the following fields
     * %
     * %            out.beta = vector containing the S estimator of regression
     * %                       coefficients
     * %            out.scale= scalar containing the estimate of the scale
     * %                       (sigma). This is the value of the objective function
     * %              out.bs = p x 1 vector containing the units forming best subset
     * %                       associated with S estimate of regression coefficient.
     * % out.residuals= n x 1 vector containing the estimates of the robust
     * %                scaled residuals.
     * % out.fittedvalues= n x 1 vector containing the fitted values.
     * %        out.outliers = this output is present only if conflev has been
     * %                       specified. It is a vector containing the list of
     * %                       the units declared as outliers using confidence
     * %                       level specified in input scalar conflev
     * %         out.conflev = confidence level which is used to declare outliers.
     * %                       Remark: scalar out.conflev will be used to draw the
     * %                       horizontal line (confidence band) in the plot.
     * %         out.singsub = Number of subsets wihtout full rank. Notice that
     * %                       out.singsub > 0.1*(number of subsamples) produces a
     * %                       warning
     * %         out.weights = n x 1 vector containing the estimates of the weights
     * %         out.rhofunc = string identifying the rho function which has been
     * %                       used
     * %    out.rhofuncparam = vector which contains the additional parameters
     * %                       for the specified rho function which have been
     * %                       used. For hyperbolic rho function the value of
     * %                       k =sup CVC. For Hampel rho function the parameters
     * %                       a, b and c
     * %            out.y    = response vector Y. The field is present if option
     * %                       yxsave is set to 1.
     * %            out.X    = data matrix X. The field is present if option
     * %                       yxsave is set to 1.
     * %           out.class = 'Sreg'
     * %
     * %  Optional Output:
     * %
     * %            C        : matrix containing the indices of the subsamples 
     * %                       extracted for computing the estimate (the so called
     * %                       elemental sets).
     * %
     * %
     * % See also: MMreg, Taureg
     * %
     * % References:
     * %
     * % Maronna, R.A., Martin D. and Yohai V.J. (2006), Robust Statistics, Theory
     * % and Methods, Wiley, New York.
     * %
     * % Acknowledgements: 
     * %
     * % This function follows the lines of MATLAB/R code developed during the
     * % years by many authors.
     * % For more details see http://www.econ.kuleuven.be/public/NDBAE06/programs/
     * % and the R library robustbase http://robustbase.r-forge.r-project.org/
     * % The core of these routines, e.g. the resampling approach, however, has
     * % been completely redesigned, with considerable increase of the
     * % computational performance.
     * %
     * % Copyright 2008-2016.
     * % Written by FSDA team
     * %
     * %
     * %<a href="matlab: docsearchFS('Sreg')">Link to the help page for this function</a>
     * % Last modified 31-05-2016
     * %
     * % Examples:
     * </pre>
     *
     * @param nargout Number of outputs to return.
     * @param rhs The inputs to the M function.
     *
     * @return Array of length nargout containing the function outputs. Outputs are 
     * returned as sub-classes of <code>com.mathworks.toolbox.javabuilder.MWArray</code>. 
     * Each output array should be freed by calling its <code>dispose()</code> method.
     *
     * @throws java.jmi.RemoteException An error has occurred during the function call or 
     * in communication with the server.
     */
    public Object[] Sreg(int nargout, Object... rhs) throws RemoteException;
    /**
     * Provides the standard interface for calling the <code>Sregeda</code> M-function 
     * with 3 input arguments.  
     *
     * Input arguments to standard interface methods may be passed as sub-classes of 
     * <code>com.mathworks.toolbox.javabuilder.MWArray</code>, or as arrays of any 
     * supported Java type (i.e. scalars and multidimensional arrays of any numeric, 
     * boolean, or character type, or String). Arguments passed as Java types are 
     * converted to MATLAB arrays according to default conversion rules.
     *
     * All inputs to this method must implement either Serializable (pass-by-value) or 
     * Remote (pass-by-reference) as per the RMI specification.
     *
     * M-documentation as provided by the author of the M function:
     * <pre>
     * %Sregeda computes S estimators in linear regression for a series of values of bdp 
     * %
     * %<a href="matlab: docsearchFS('Sregeda')">Link to the help function</a>
     * %
     * %  Required input arguments:
     * %
     * %    y: Response variable. Vector. A vector with n elements that contains
     * %       the response variable. y can be either a row or a column vector.
     * %    X: Data matrix of explanatory variables (also called 'regressors') of
     * %       dimension (n x p-1). Rows of X represent observations, and columns
     * %       represent variables.
     * %       Missing values (NaN's) and infinite values (Inf's) are allowed,
     * %       since observations (rows) with missing or infinite values will
     * %       automatically be excluded from the computations.
     * %
     * %  Optional input arguments:
     * %
     * %  intercept :  Indicator for constant term. Scalar. If 1, a model with
     * %               constant term will be fitted (default), else no constant
     * %               term will be included.
     * %               Example - 'intercept',1 
     * %               Data Types - double
     * %         bdp :  breakdown point. Scalar or vector.
     * %               It measures the fraction of outliers
     * %               the algorithm should resist. In this case any value greater
     * %               than 0 but smaller or equal than 0.5 will do fine.
     * %               The default value of bdp is a sequence from 0.5 to 0.01 with step 
     * 0.01
     * %                 Example - 'bdp',[0.5 0.4 0.3 0.2 0.1]
     * %                 Data Types - double
     * %     rhofunc : rho function. String. String which specifies the rho function 
     * which must be used to
     * %               weight the residuals. Possible values are
     * %               'bisquare'
     * %               'optimal'
     * %               'hyperbolic'
     * %               'hampel'.
     * %               'bisquare' uses Tukey's $\\rho$ and $\\psi$ functions.
     * %               See TBrho.m and TBpsi.m.
     * %               'optimal' uses optimal $\\rho$ and $\\psi$ functions.
     * %               See OPTrho.m and OPTpsi.m.
     * %               'hyperbolic' uses hyperbolic $\\rho$ and $\\psi$ functions.
     * %               See HYPrho.m and HYPpsi.m.
     * %               'hampel' uses Hampel $\\rho$ and $\\psi$ functions.
     * %               See HArho.m and HApsi.m.
     * %               The default is bisquare
     * %                 Example - 'rhofunc','optimal' 
     * %                 Data Types - double
     * % rhofuncparam: Additional parameters for the specified rho function.
     * %               Scalar or vector.
     * %               For hyperbolic rho function it is possible to set up the
     * %               value of k = sup CVC (the default value of k is 4.5).
     * %               For Hampel rho function it is possible to define parameters
     * %               a, b and c (the default values are a=2, b=4, c=8)
     * %                 Example - 'rhofuncparam',5 
     * %                 Data Types - single | double
     * %       nsamp   : Number of subsamples which will be extracted to find the
     * %                 robust estimator. Scalar. If nsamp=0 all subsets will be 
     * extracted.
     * %                 They will be (n choose p).
     * %                 If the number of all possible subset is <1000 the
     * %                 default is to extract all subsets otherwise just 1000.
     * %                 Example - 'nsamp',1000 
     * %                 Data Types - single | double
     * %    refsteps : Number of refining iterations. Scalar. Number of refining 
     * iterationsin each
     * %               subsample (default = 3).
     * %               refsteps = 0 means "raw-subsampling" without iterations.
     * %                 Example - 'refsteps',10 
     * %                 Data Types - single | double
     * %     reftol  : tolerance for the refining steps. Scalar. 
     * %               The default value is 1e-6;
     * %                 Example - 'reftol',1e-05 
     * %                 Data Types - single | double
     * %refstepsbestr: number of refining iterations for each best subset. Scalar.
     * %               Scalar defining number of refining iterations for each
     * %               best subset (default = 50).
     * %                 Example - 'refstepsbestr',10 
     * %                 Data Types - single | double
     * % reftolbestr : Tolerance for the refining steps. Scalar. 
     * %               Tolerance for the refining steps
     * %               for each of the best subsets
     * %               The default value is 1e-8;
     * %                 Example - 'reftolbestr',1e-10 
     * %                 Data Types - single | double
     * %     minsctol: tolerance for the iterative
     * %               procedure for finding the minimum value of the scale. Scalar. 
     * %               Value of tolerance for the iterative
     * %               procedure for finding the minimum value of the scale
     * %               for each subset and each of the best subsets
     * %               (It is used by subroutine minscale.m)
     * %               The default value is 1e-7;
     * %                 Example - 'minsctol',1e-7 
     * %                 Data Types - single | double
     * %      bestr  : number of "best betas" to remember. Scalar. Scalar defining number 
     * of "best betas" to remember from the
     * %               subsamples. These will be later iterated until convergence
     * %               (default=5)
     * %                 Example - 'bestr',10 
     * %                 Data Types - single | double
     * %     conflev :  Confidence level which is
     * %               used to declare units as outliers. Scalar
     * %               Usually conflev=0.95, 0.975 0.99 (individual alpha)
     * %               or 1-0.05/n, 1-0.025/n, 1-0.01/n (simultaneous alpha).
     * %               Default value is 0.975
     * %                 Example - 'conflev',0.99
     * %                 Data Types - double
     * %        msg  : Level of output to display. Scalar. It controls whether
     * %                 to display or not messages on the screen.
     * %               If msg==1 (default) messages are displayed
     * %               on the screen about estimated time to compute the estimator
     * %               and the warnings about
     * %               'MATLAB:rankDeficientMatrix', 'MATLAB:singularMatrix' and
     * %               'MATLAB:nearlySingularMatrix' are set to off
     * %               else no message is displayed on the screen
     * %                 Example - 'msg',0 
     * %                 Data Types - single | double
     * %       nocheck : Check input arguments. Scalar. If nocheck is equal to 1 no check 
     * is performed on
     * %                 matrix y and matrix X. Notice that y and X are left
     * %                 unchanged. In other words the additional column of ones
     * %                 for the intercept is not added. As default nocheck=0.
     * %               Example - 'nocheck',1 
     * %               Data Types - double
     * %       plots : Plot on the screen. Scalar.
     * %               If plots = 1, generates a plot with the robust residuals
     * %               for each value of bdp. The confidence level used to draw the
     * %               confidence bands for the residuals is given by the input
     * %               option conflev. If conflev is not specified a nominal 0.975
     * %               confidence interval will be used.
     * %                 Example - 'plots',0 
     * %                 Data Types - single | double
     * %
     * %  Output:
     * %
     * %  out :     A structure containing the following fields
     * %
     * %            out.Beta = matrix containing the S estimator of regression
     * %                       coefficients for each value of bdp
     * %            out.Scale= vector containing the estimate of the scale
     * %                       (sigma) for each value of bdp. This is the value of the 
     * objective function
     * %              out.BS = p x 1 vector containing the units forming best subset
     * %                       associated with S estimate of regression coefficient.
     * %              out.RES= n x length(bdp) matrix containing the robust
     * %                       scaled residuals for each value of bdp
     * %         out.Weights = n x length(bdp) vector containing the estimates of
     * %                       the weights for each value of bdp
     * %        out.Outliers = Boolean matrix containing the list of
     * %                       the units declared as outliers for each value of bdp using 
     * confidence
     * %                       level specified in input scalar conflev
     * %         out.conflev = confidence level which is used to declare outliers.
     * %                       Remark: scalar out.conflev will be used to draw the
     * %                       horizontal line (confidence band) in the plot.
     * %         out.Singsub = Number of subsets wihtout full rank. Notice that
     * %                       out.singsub(bdp(jj)) > 0.1*(number of subsamples) produces 
     * a
     * %                       warning
     * %         out.rhofunc = string identifying the rho function which has been
     * %                       used
     * %    out.rhofuncparam = vector which contains the additional parameters
     * %                       for the specified rho function which have been
     * %                       used. For hyperbolic rho function the value of
     * %                       k =sup CVC. For Hampel rho function the parameters
     * %                       a, b and c
     * %           out.bdp   = vector which contains the values of bdp which have
     * %                       been used
     * %            out.y    = response vector y. The field is present if option
     * %                       yxsave is set to 1.
     * %            out.X    = data matrix X. The field is present if option
     * %                       yxsave is set to 1.
     * %           out.class = 'Sregeda'
     * %
     * %  Optional Output:
     * %
     * %            C        : matrix containing the indices of the subsamples 
     * %                       extracted for computing the estimate (the so called
     * %                       elemental sets).
     * %
     * %
     * % See also: Sreg, MMreg, Taureg
     * %
     * % References:
     * %
     * % RIANI M., CERIOLI A., ATKINSON A.C., PERROTTA D. (2014). Monitoring
     * % Robust Regression. ELECTRONIC JOURNAL OF STATISTICS, Vol. 8 pp. 646-677.
     * % Maronna, R.A., Martin D. and Yohai V.J. (2006), Robust Statistics, Theory
     * % and Methods, Wiley, New York.
     * %
     * %
     * % Copyright 2008-2016.
     * % Written by FSDA team
     * %
     * %
     * %<a href="matlab: docsearchFS('Sregeda')">Link to the help page for this 
     * function</a>
     * % Last modified 31-05-2016
     * %
     * % Examples:
     * </pre>
     *
     * @param nargout Number of outputs to return.
     * @param rhs The inputs to the M function.
     *
     * @return Array of length nargout containing the function outputs. Outputs are 
     * returned as sub-classes of <code>com.mathworks.toolbox.javabuilder.MWArray</code>. 
     * Each output array should be freed by calling its <code>dispose()</code> method.
     *
     * @throws java.jmi.RemoteException An error has occurred during the function call or 
     * in communication with the server.
     */
    public Object[] Sregeda(int nargout, Object... rhs) throws RemoteException;
  
    /** Frees native resources associated with the remote server object */
    void dispose() throws RemoteException;
}
