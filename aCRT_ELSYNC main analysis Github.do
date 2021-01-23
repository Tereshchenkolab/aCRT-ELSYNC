***STATA code written by Larisa Tereshchenko <tereshch@ohsu.edu>
*** for analysis of ELSYNC RCT data
***August 2020
***Stata 16


gen UI1  = meanLV1 - meanRV1
gen UI2  = meanLV2 - meanRV2
gen difUI = UI2 - UI1

gen difmeanLV = meanLV2 - meanLV1
gen difmeanRV = meanRV2 - meanRV1
ranksum difmeanRV if aCRT<2, by(aCRT) porder
by aCRT, sort : summarize difmeanRV if aCRT<2, detail
ranksum difmeanLV if aCRT<2, by(aCRT) porder
by aCRT, sort : summarize difmeanLV if aCRT<2, detail


**Table 1 baseline comparison
oneway age aCRT, tabulate missing
oneway QRSdur1 aCRT, tabulate missing
oneway qtc1 aCRT, tabulate missing
oneway pr1 aCRT if pr1>0, tabulate missing
tabulate lbbb1 aCRT, chi2 column
tabulate mi_hist aCRT, chi2 column
tabulate hist_cabg_pci aCRT, chi2 column mis
tabulate CHD_vessels aCRT, chi2 column mis
tabulate dm aCRT, chi2 column mis
tabulate htn  aCRT, chi2 column mis
tabulate copd  aCRT, chi2 column mis
tabulate smoking  aCRT, chi2 column mis
tabulate BB  aCRT, chi2 column mis
tabulate acei_arb  aCRT, chi2 column mis
oneway lvddi1 aCRT , tabulate
oneway lvsdi1 aCRT , tabulate

***Table 2 ITT analysis
tab aCRT
ranksum stdFV1 if aCRT<2, by(aCRT) porder
by aCRT, sort : summarize stdFV1 if aCRT<2, detail
ranksum stdLV1 if aCRT<2, by(aCRT) porder
by aCRT, sort : summarize stdLV1 if aCRT<2, detail
ranksum stdRV1 if aCRT<2, by(aCRT) porder
by aCRT, sort : summarize stdRV1 if aCRT<2, detail
ranksum stdFV2 if aCRT<2, by(aCRT) porder
by aCRT, sort : summarize stdFV2 if aCRT<2, detail
ranksum stdLV2 if aCRT<2, by(aCRT) porder
by aCRT, sort : summarize stdLV2 if aCRT<2, detail
ranksum stdRV2 if aCRT<2, by(aCRT) porder
by aCRT, sort : summarize stdRV2 if aCRT<2, detail
ranksum dif_std if aCRT<2, by(aCRT) porder
by aCRT, sort : summarize dif_std if aCRT<2, detail
ranksum dif_stdLV if aCRT<2, by(aCRT) porder
by aCRT, sort : summarize dif_stdLV if aCRT<2, detail
ranksum dif_stdRV if aCRT<2, by(aCRT) porder
by aCRT, sort : summarize dif_stdRV if aCRT<2, detail
ranksum fullv_p20f1 if aCRT<2, by(aCRT) porder
by aCRT, sort : summarize fullv_p20f1 if aCRT<2, detail
ranksum fullv_p80f1 if aCRT<2, by(aCRT) porder
by aCRT, sort : summarize fullv_p80f1 if aCRT<2, detail
ranksum leftv_p20f1 if aCRT<2, by(aCRT) porder
by aCRT, sort : summarize leftv_p20f1 if aCRT<2, detail
ranksum leftv_p80f1 if aCRT<2, by(aCRT) porder
by aCRT, sort : summarize leftv_p80f1 if aCRT<2, detail
ranksum rightv_p20f1 if aCRT<2, by(aCRT) porder
by aCRT, sort : summarize rightv_p20f1 if aCRT<2, detail
ranksum rightv_p80f1 if aCRT<2, by(aCRT) porder
by aCRT, sort : summarize rightv_p80f1 if aCRT<2, detail
ranksum fullv_p20f2 if aCRT<2, by(aCRT) porder
by aCRT, sort : summarize fullv_p20f2 if aCRT<2, detail
ranksum fullv_p80f2 if aCRT<2, by(aCRT) porder
by aCRT, sort : summarize fullv_p80f2 if aCRT<2, detail
ranksum leftv_p20f2 if aCRT<2, by(aCRT) porder
by aCRT, sort : summarize leftv_p80f2 if aCRT<2, detail
ranksum leftv_p80f2 if aCRT<2, by(aCRT) porder
by aCRT, sort : summarize leftv_p20f2 if aCRT<2, detail
ranksum rightv_p20f2 if aCRT<2, by(aCRT) porder
by aCRT, sort : summarize rightv_p20f2 if aCRT<2, detail
ranksum rightv_p80f2 if aCRT<2, by(aCRT) porder
by aCRT, sort : summarize rightv_p80f2 if aCRT<2, detail
gen diff_Vp20 = fullv_p20f2 - fullv_p20f1
gen diff_Vp80 = fullv_p80f2 - fullv_p80f1
gen diff_LVp20 = leftv_p20f2 - leftv_p20f1
gen diff_LVp80 = leftv_p80f2 - leftv_p80f1
gen diff_RVp20 = rightv_p20f2 - rightv_p20f1
gen diff_RVp80 = rightv_p80f2 - rightv_p80f1
ranksum diff_Vp20 if aCRT<2, by(aCRT) porder
ranksum diff_LVp20 if aCRT<2, by(aCRT) porder
ranksum diff_RVp20 if aCRT<2, by(aCRT) porder
ranksum diff_Vp80 if aCRT<2, by(aCRT) porder
ranksum diff_LVp80 if aCRT<2, by(aCRT) porder
ranksum diff_RVp80 if aCRT<2, by(aCRT) porder
by aCRT, sort : summarize diff_LVp80 if aCRT<2, detail
by aCRT, sort : summarize diff_LVp80 if aCRT<2, detail
by aCRT, sort : summarize diff_RVp80 if aCRT<2, detail
by aCRT, sort : summarize diff_Vp80 if aCRT<2, detail
by aCRT, sort : summarize diff_Vp20 if aCRT<2, detail
by aCRT, sort : summarize diff_LVp20 if aCRT<2, detail
by aCRT, sort : summarize diff_RVp20 if aCRT<2, detail
ranksum UI1 if aCRT<2, by(aCRT) porder
ranksum UI2 if aCRT<2, by(aCRT) porder
by aCRT, sort : summarize UI1 if aCRT<2, detail
by aCRT, sort : summarize UI2 if aCRT<2, detail
ranksum difUI if aCRT<2, by(aCRT) porder
by aCRT, sort : summarize difUI if aCRT<2, detail
rename UI1 VEU1
rename UI2 VEU2
rename difUI difVEU
ranksum meanRV1 if aCRT<2, by(aCRT) porder
by aCRT, sort : summarize meanRV1 if aCRT<2, detail
ranksum meanRV2 if aCRT<2, by(aCRT) porder
by aCRT, sort : summarize meanRV2 if aCRT<2, detail
ranksum meanLV1 if aCRT<2, by(aCRT) porder
by aCRT, sort : summarize meanLV1 if aCRT<2, detail
ranksum meanLV2 if aCRT<2, by(aCRT) porder
by aCRT, sort : summarize meanLV2 if aCRT<2, detail


***paired comparison
by aCRT, sort : signrank rightv_p20f1 = rightv_p20f2 if aCRT<2
by aCRT, sort : signrank rightv_p80f1 = rightv_p80f2 if aCRT<2
by aCRT, sort : signrank leftv_p80f1 = leftv_p80f2 if aCRT<2
by aCRT, sort : signrank fullv_p80f1 = fullv_p80f2 if aCRT<2
by aCRT, sort : signrank stdFV1 = meanFV2 if aCRT<2
by aCRT, sort : signrank stdLV1 = meanLV2 if aCRT<2
by aCRT, sort : signrank stdRV1 = meanRV2 if aCRT<2
by aCRT, sort : signrank rangeFV1 = rangeFV2 if aCRT<2
by aCRT, sort : signrank rangeLV1 = rangeLV2 if aCRT<2
by aCRT, sort : signrank rangeRV1 = rangeRV2 if aCRT<2

***surface ECG metrics
ranksum QRSdur1 if aCRT<2, by(aCRT) porder
by aCRT, sort : summarize QRSdur1 if aCRT<2, detail
ranksum QRSdur2 if aCRT<2, by(aCRT) porder
by aCRT, sort : summarize QRSdur2 if aCRT<2, detail
gen difQRSdur = QRSdur2 - QRSdur1
ranksum difQRSdur if aCRT<2, by(aCRT) porder
by aCRT, sort : summarize difQRSdur if aCRT<2, detail
by aCRT, sort : signrank QRSdur1 = QRSdur2 if aCRT<2

ranksum SMW1 if aCRT<2, by(aCRT) porder
ranksum SMW2 if aCRT<2, by(aCRT) porder
gen difSMW = SMW2-SMW1
ranksum difSMW if aCRT<2, by(aCRT) porder
by aCRT, sort : summarize SMW1 if aCRT<2, detail
by aCRT, sort : summarize SMW2 if aCRT<2, detail
by aCRT, sort : signrank SMW1 = SMW2 if aCRT<2
by aCRT, sort : summarize difSMW if aCRT<2, detail

gen difMLHFQ = mlhfq_tot2 - mlhfq_tot1
ranksum difMLHFQ if aCRT<2, by(aCRT) porder
by aCRT, sort : signrank mlhfq_tot1 = mlhfq_tot2 if aCRT<2
by aCRT, sort : summarize mlhfq_tot1 if aCRT<2, detail
by aCRT, sort : summarize mlhfq_tot2 if aCRT<2, detail
by aCRT, sort : summarize difMLHFQ if aCRT<2, detail
 signrank mlhfq_tot1 = mlhfq_tot2 if aCRT<2
 signrank mlhfq_tot1 = mlhfq_tot2
by aCRT, sort : signrank gen_health1 = gen_health2 if aCRT<2
by aCRT, sort : signrank pain1 = pain2 if aCRT<2
by aCRT, sort : signrank soc_funct1 = soc_funct2 if aCRT<2
by aCRT, sort : signrank emotwellbe1 = emotwellbe2 if aCRT<2
by aCRT, sort : signrank energy1 = energy2 if aCRT<2
by aCRT, sort : signrank limit_emot1 = limit_emot2 if aCRT<2
by aCRT, sort : signrank limit_phys1 = limit_phys2 if aCRT<2
by aCRT, sort : signrank phys_funct1 = phys_funct2 if aCRT<2
by aCRT, sort : summarize limit_phys2 if aCRT<2, detail
by aCRT, sort : summarize limit_phys1 if aCRT<2, detail
by aCRT, sort : summarize energy1 if aCRT<2, detail
by aCRT, sort : summarize energy2 if aCRT<2, detail

***correlation between epicardial and surface ECG metrics
spearman VEU1 stdRV1 stdLV1 stdFV1 QRSdur1  areaQRS1 SAIQRST1, stats(rho p)

npregress kernel stdLV1 SAIQRST1 age i.sex, vce(bootstrap)

***plotting change in veu
reshape long meanFV meanLV meanRV  VEU SAIQRST rangeRV rangeLV, i(ID) j(visit 1 2)
twoway (connected VEU visit, connect(ascending)) if aCRT==1
twoway (connected VEU visit, connect(ascending)) if aCRT==0