2180.0	altitude, m@Larm
1.0 41.367 	latitude
-105.238	longitude
0.45	z_ref, m 
0.3 2.0 20.0	lai, single sided
1.0 0.1 1.00  canopy_cover
0.3	canopy_height, m
0.00	fcloud, may model
1.0	l_angle, spherical, may sample
0.97	canopy emissivity
0.5 0.01	fPAR_beam
0.5 0.99	fPAR_diff
0.8	alpha_PAR
0.2	alpha_NIR
0.5 0.5 1.00	omega
2.0	p_crown
0.5	d_factor, C&Nfig5.5
0.1	zm_factor, C&Nfig5.5
0.2	zh_factor, 7.19
0.02 0.001 0.010      Rd_mult, Rd=Rd_mult*Vcmax
1.85 3.27 3.0    Jmax_mult, ratio of Jmax to Vcmax
0.80 0.7 0.99     thetaJ, curvature parameter
0.4 0.4 0.5   phiJ_sun, quantum yield, e-/photon
0.4 0.2 0.5   phiJ_shd, quantum yield, e-/photon
0.001815 0.0900    Nleaf
0.0 0.785138 1.0 N_fixed_proportion
0.1 0.16 0.2  Nrubisco, proportion
38.67764 23.9 62.9  Kc25, (Pa) MM const carboxylase, 25 deg C
2.1    q10Kc, (DIM) Q_10 for kc (default 2.1)
26123.26 17600 51600   Ko25, (Pa) MM const oxygenase, 25 deg C
1.2    q10Ko, (DIM) Q_10 for ko
3.6    act25, (umol/mgRubisco/min) Rubisco activity
2.4 2.0 3.0    q10act, (DIM) Q_10 for Rubisco activity (default was 2.4)
0.15 1.0  	Gsref
0.54 0.487439 0.61  	m (proportion of Gsref)
-0.1   Md
-0.5 -1.0 -1.6 midday_at_sat_kl
2.5 0.5 3.0 e_at_saturated_kl
4.0 rhizosphere_width_(mm)
0.001 E_inc(Sperry98_pg351_last_para.)
4 soilshells
0.1 GMP_(mm)_geometric_mean_particle_diameter
15.0 GSD_geometric_standard_deviation_of_particle_size
1.5 BD_(MG/m3)_soil_bulk_density
0.35  0.4 0.5 porosity
0.3 silt_fraction
0.2 clay_fraction
1.0 frac_absorbing_length
0.01 0.1 10.0 Capacitance_(mol/Mpa*m2)_on_leaf_area_basis
1.0 axK:latKr_shoot_modules
1.0 axkr:latKr_root_modules
50.0 %total_R_in_root_system
18.0 saturated_kl_for_whole_plant (recalculated in the model)
-0.2 -0.1 0.05  pd_at_sat_kl
1.57 2 0.9 1.5 ax_Shoot-b_value_(weibull)
2.38 0.9 1.5 ax_Shoot-c_value_(weibull)
1.57 0.9 1.5 lat_Shoot-b_value_(weibull)
2.38 0.9 1.5 lat_Shoot-c_value_(weibull)
1.57 1.5 ax_Root-b_value_(weibull)
2.38 1.5 ax_Root-c_value_(weibull)
1.57 1.383 1.5 lat_Root-b_value_(weibull)
2.38 1.48 1.5 lat_Root-c_value_(weibull)
3.0 initial_conductivity(root)
0.01 decrement(root)- default 0.001
6.0 initial_conductivity(shoot)
0.05 decrement(shoot)
0.22 0.05 0.48 theta_opt
30.0 25.0 45.0 optimal_soil_T
1.0   growth_resp_proportion
0.0011 resp_coef_root, kg kg-1 day-1 deg 
0.0002 resp_coefficient_stem, kg kg-1 day-1 deg
0.0004 resp_coefficient_leaf, kg kg-1 day-1 deg
0.05 0.085 resp_coefficient (Q10), degC-1
72.26 71.22 73.30 EaSx, kjmol-1
0.000000995 0.000000877 0.00000111 kMsx, gCcm-3soil
0.000000000538 0.000000000347 0.000000000834 mgCcm-3soilh-1
0.0085 0.0085 0.004256 kd, d-1
0.6 0.6 0.6 kn, m3 d-1 gC-1
0.4 0.2 0.03 kea, m3 d-1 gC-1 (for exudates)
0.6 0.6 0.4 0.03 kes, m3 d-1 gC-1 (for exudates)
0.000065 0.00001625 0.000065 kl, m3 d-1 gC-1
0.0000025 0.0000025 kh, m3 d-1 gC-1
79200.0 214000.0 19782.4 Cbelowground, kg ha-1
0.000027 0.00001 0.0152229  Clitter_frac, dim
0.00024 0.0000375 0.021 Croot_frac, dim
1.00 13710.0 29460.0 Cstem, kg ha-1
10.0 130000.0 2.0 Csapwood, kg ha-1
0.00024 0.00216 0.1 Croot_coarse_frac, dim
0.002 0.000001 0.05 litter_capacity, m
0.29 0.1 0.48 theta_deep0, initial
0.28 0.05 0.48 theta_mid0, initial
0.27 0.05 0.48 theta_shallow0, initial
0.000 0.001 0.05 litter_store, initial
500.0 28.6 SLA, m2 kgC-1 leaf
1454.0 150000.0 SRL1, m gC-1 specific root length at root diameter of 250 um
0.000125 0.000125 minRootDiam, m diameter of thickest root
0.004 0.064 maxRootDiam, m diameter of thickest root
1.0 0.04 minRootLifespan, years, lifespan of finest root at lowest C:N ratio
0.5 0.1 1.0 LWP_spring_minimum, -MPa
2.35 1.5 2.5 LWP_stomatal_closure, -MPa
0 is_bryophyte (1 is yes, 0 is no)
0.1 0.0 1.0 capRiseScalar, (0 to 1)
1.0 0.0 1.0 precipReduction
0.0 0.0 1.0 drainScalar, (0 to 1) proportion of drainage absorbed by water table
0.10 0.01 0.1 leafNSCscalar (proportion of leaf structural carbon)
0 usePhenology
999999999.0 leafLife Span
10 max_iteration(the_max_number_of_iterations_to_achieve_convergence_Delta<THR
83.3 3.0 7.01 microbiomeScalar, unitless, multiplier for the initial nutrient status of microbiome
0.0 snowpack_water_equivalent, m
0.0 snowpack_E_deficit_max, deg C
0.0015 melt_Rcoef, m degC-1 30-min-1
1 0 1 useHydraulics
0 0 1 useInputStress
1 0 1 useRefilling
0 0 1 forceRefilling
1 useLeafModule
38.59 leafAreaMax // K
0.65 initialLeafSize //A_pot_in
0.0008926 leafArea_Rate //r
9708.083 dur_LeafExpansion//d_exp
400.0 SLA_max //SLA_max
60.0 SLA_min //SLA_min
85 leaf_insertAngle // leaf insertion angle
1.25 leaf_len_to_width // leaf length to width ratio
0.90 proportion_CD //a
1026.731 phyllochron //phyllochron
50000.0 floweringTime //TTF
0.96 Tbase //Tb
2566.8275 therm_plant
35.0 projectedArea_init // projected shoot area at initiation
40.0 pot_size //max projected area, cm2
0.24     root_to_shoot
35.4    leaf_to_stem
0 useLeafGamma;
883.31 Kalpha;
22.87 Kbeta;
8.11 Nalpha;
11.89 Nbeta;
118.31 ralpha;
131431.51 rbeta;
10 0.00001 100.0 sd_err_Ec
2.12692 0.001 15.0 sd_err_NEE
0.0 0.0 1.0 sd_err_Ec_weight
