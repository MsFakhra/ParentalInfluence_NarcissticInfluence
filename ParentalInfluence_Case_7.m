%Child learning to be a narcissist
% Network-Oriented Modeling based on temporal-causal network models is described 
% in the following books (indicated by Book 1 and Book 2, respectively):

%       Treur, J. (2016). Network-Oriented Modeling: Addressing Complexity  
%           of Cognitive, Affective and Social Interactions. Springer Publishers. 
%           Downloadable at http://link.springer.com/book/10.1007/978-3-319-45213-5
%           Table of Contents for this Book 1 with links to abstracts and   
%           slides per chapter: https://www.researchgate.net/publication/305930006
%       Treur, J. (2020). Network-Oriented Modeling for Adaptive Networks: 
%           Designing Higher-Order Adaptive Biological, Mental, and Social  
%           Network Models. Springer Publishers. Available by the end of October 2019.
%           Table of Contents for this Book 2 with links to abstracts and 
%           slides per chapter: https://www.researchgate.net/publication/334576216

% This particular Network-Oriented Modeling Environment NOMEadaptive is a 
% software environment for multi-order adaptive networks based on
% reified temporal-causal network models, implemented by 
% the author, as described in Book 2.
%CASE I:Child displaying influence of Parent’s Narcissism
%This is a case when parent is giving his stimulus (narcissist) to the kid and kid also becomes a narcissist (Total replica of trait)
%Case II: Child learning not to be a Narcissist: 
%This is a case when parent is giving his stimulus (narcissist) to the kid and kid don’t copy this totally from his parent and react otherwise, but this is done with the passage of time (age)

dbstop if error;
clearvars;
global dt;
global k;

%\\\\\\\\\\\\\\\\\\ TO BE FILLED \\\\\\\\\\\\\\\\\\\%
%%%%%%%%%%%%%% Combination functions used %%%%%%%%%%%%
mcf=[1 2 3 35];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%///////////////////////////////////////////////////%

% This vector mcf makes the selection of the specific combination functions  
% from the library used for this particular network model. The entries of this 
% vector can be any numbers from 1 to 35, as the library currently has 35  
% basic combination functions. For an overview of the library, see
% https://www.researchgate.net/publication/333662169 

% Next, the role matrices for the base connectivity and the different network   
% characteristics according to their roles are specified (See Book 2, Chapter 9, 
% Section 9.4.1, and examples in Tables 9.2 to 9.4):

% 1. The role matrix for base connectivity and role matrices for nonadaptive 
%    network characteristics:
%       mb      for base connectivity 
%       mcwv    for nonadaptive connection weight values 
%       msv     for nonadaptive speed factor values
%       mcfwv	for nonadaptive combination function weight values 
%       mcfpv   for nonadaptive combination function parameter values

% 2. The role matrices for adaptive network characteristics:
%       mcwa    for adaptive connection weights 
%       msa     for adaptive speed factors
%       mcfwa	for adaptive combination function weights 
%       mcfpa   for adaptive combination function parameters

% Note that: 
% a) for each cell in a role matrix for adaptive network characteristics, if it  
% indicates a value not NaN, then the same cell of the corresponding role matrix  
% for nonadaptive network characteristics indicates NaN. 
% b) for each cell in a role matrix for nonadaptive network characteristics, if it 
% indicates a value not NaN, then the same cell of the corresponding role matrix  
% for adaptive network characteristics indicates NaN. 

% Moreover,note that here as an illustration the (differentiated) role matrices of the 
% example reified network model shown in Book 2, Chapter 4, Section 4.4.2, Box 4.1 
% are filled in these matrices. These entries can be removed and 
% replaced by other entries.

%\\\\\\\\\\\\\\\\\\ TO BE FILLED \\\\\\\\\\\\\\\\\\\%
%%%%%%%%%%%%%%% Value role matrices %%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%% and Initial values %%%%%%%%%%%%%%%%%

mcf=[1 2 3 35];
%%%%% Connection Matrix
mb=[1	NaN	NaN	NaN	NaN		%	wspf
2	NaN	NaN	NaN	NaN		%	wsnf
3	NaN	NaN	NaN	NaN		%	wss
1	NaN	NaN	NaN	NaN		%	sspf
2	NaN	NaN	NaN	NaN		%	ssnf
3	NaN	NaN	NaN	NaN		%	sss
4	6	NaN	NaN	NaN		%	srspf
5	6	NaN	NaN	NaN		%	srsnf
9	14	NaN	NaN	NaN		%	bs
11	NaN	NaN	NaN	NaN		%	pfc
7	9	NaN	NaN	NaN		%	eval+
10	11	15	19	NaN		%	vent_sat
12	NaN	NaN	NaN	NaN		%	eshappy
9	16	NaN	NaN	NaN		%	flove
16	NaN	NaN	NaN	NaN		%	freward
12	NaN	NaN	NaN	NaN		%	a.insula
9	18	NaN	NaN	NaN		%	cs
8	17	NaN	NaN	NaN		%	eval-
18	27	28	NaN	NaN		%	psa
19	21	33	NaN	NaN		%	os
19	20	37	NaN	NaN		%	esaction
13	26	NaN	NaN	NaN		%	wsang
22	NaN	NaN	NaN	NaN		%	ssang
23	NaN	NaN	NaN	NaN		%	srsang
18	24	27	NaN	NaN		%	psang
25	NaN	NaN	NaN	NaN		%	esang
25	NaN	NaN	NaN	NaN		%	fsang
29	33	NaN	NaN	NaN		%	val
30	NaN	NaN	NaN	NaN		%	fsemp
29	33	NaN	NaN	NaN		%	psemp
21	NaN	NaN	NaN	NaN		%	wseff
31	NaN	NaN	NaN	NaN		%	sseff
19	32	NaN	NaN	NaN		%	srseff
37	NaN	NaN	NaN	NaN		%	wsanx
34	NaN	NaN	NaN	NaN		%	ssanx
36	NaN	NaN	NaN	NaN		%	srsanx
33	36	38	NaN	NaN		%	psanx
37	NaN	NaN	NaN	NaN		%	fanx
9	14	39	NaN	NaN		%	omega_bs_flove
9	14	40	NaN	NaN		%	omega_flove_bs
12	16	41	NaN	NaN		%	omega_satrium_hipp
12	15	42	NaN	NaN		%	omega_freward_satrium
19	33	43	NaN	NaN		%	omega_psa_srspe
19	27	44	NaN	NaN		%	omega_fsAng_psa
18	19	45	NaN	NaN		%	omega_eval_psa
24	36	46	NaN	NaN		%	Hsrsang,srsanx
24	36	47	NaN	NaN		%	Msrsang,srsanx
NaN	NaN	NaN	NaN	NaN		%	ssh
48	NaN	NaN	NaN	NaN		%	srsh
49	52	NaN	NaN	NaN		%	c-bs+
49	NaN	NaN	NaN	NaN		%	c-PFC
50	54	NaN	NaN	NaN		%	c-fslove
54	NaN	NaN	NaN	NaN		%	c-fsreward
55	NaN	NaN	NaN	NaN		%	c-insula
49	51	52	53	NaN		%	c-striatum
55	NaN	NaN	NaN	NaN		%	c-eshappy
49	NaN	NaN	NaN	NaN		%	evalh
57	61	NaN	NaN	NaN		%	psact
58	NaN	NaN	NaN	NaN		%	esact
58	NaN	NaN	NaN	NaN		%	hipp
60	NaN	NaN	NaN	NaN		%	fssat
62	NaN	NaN	NaN	NaN		%	wss
62	NaN	NaN	NaN	NaN		%	sss
63	NaN	NaN	NaN	NaN		%	srss
50	66	NaN	NaN	NaN		%	ccs
65	64	NaN	NaN	NaN		%	evals
72	NaN	NaN	NaN	NaN		%	exp
67	NaN	NaN	NaN	NaN		%	fsnovel
67	NaN	NaN	NaN	NaN		%	em
67	NaN	NaN	NaN	NaN		%	urge
67	72	73	NaN	NaN		%	os
66	68	69	70	NaN		%	psshare
71	72	NaN	NaN	NaN		%	esshare
49	57	74	NaN	NaN		%	omega_srsh_evalh
50	52	75	NaN	NaN		%	omega_cbs_fslove
52	50	76	NaN	NaN		%	omega_fslove_cbs
55	54	77	NaN	NaN		%	omega_striatum_insula
53	55	78	NaN	NaN		%	omega_fsreward_striatum
52	55	79	NaN	NaN		%	omega_fslove_striatum
58	60	80	NaN	NaN		%	omega_psact_hipp
61	58	81	NaN	NaN		%	omega_fssat_psact
72	67	82	NaN	NaN		%	omega_pshare_exp
68	72	83	NaN	NaN		%	omega_fsnovel_pshare
69	72	84	NaN	NaN		%	omega_em_pshare
70	72	85	NaN	NaN		%	omega_urge_pshare
49	57	74  86	NaN		%	H_srsh_evalh
50	52	75  87	NaN		%	H_cbs_fslove
52	50	76  88	NaN		%	H_fslove_cbs
55	54	77  89	NaN		%	H_striatum_insula
53	55	78  90	NaN		%	H_fsreward_striatum
52	55	79  91	NaN		%	H_fslove_striatum
58	60	80  92	NaN		%	H_psact_hipp
61	58	81  93	NaN		%	H_fssat_psact
72	67	82	94	NaN		%	H_pshare_exp
68	72	83	95	NaN		%	H_fsnovel_pshare
69	72	84	96	NaN		%	H_em_pshare
70	72	85	97	NaN		%	H_urge_pshare
49	57	74  98	NaN		%	M_srsh_evalh
50	52	75  99	NaN		%	M_cbs_fslove
52	50	76  100	NaN		%	M_fslove_cbs
55	54	77  101	NaN		%	M_striatum_insula
53	55	78  102	NaN		%	M_fsreward_striatum
52	55	79  103	NaN		%	M_fslove_striatum
58	60	80  104 NaN		%	M_psact_hipp
61	58	81  105	NaN		%	M_fssat_psact
72	67	82	106	NaN		%	M_pshare_exp
68	72	83	107	NaN		%	M_fsnovel_pshare
69	72	84	108	NaN		%	M_em_pshare
70	72	85	109	NaN		%	M_urge_pshare
26	NaN	NaN	NaN	NaN		%	ssa	
110	NaN	NaN	NaN	NaN		%	srsa	
111	113	114	NaN	NaN		%	c-bs-	
112	115	NaN	NaN	NaN		%	c-fssorrow	
112	115	NaN	NaN	NaN		%	c-fsstress	
111	113	114	NaN	NaN		%	cpsiso	
115	NaN	NaN	NaN	NaN		%	cesiso	
111	NaN	NaN	NaN	NaN		%	evald	
121	NaN	NaN	NaN	NaN		%	hipp2	
118	NaN	NaN	NaN	NaN		%	fsselfsatisfaction	
117	121	NaN	NaN	NaN		%	pos	
117	119	120	NaN	NaN		%	cpsavd	
120	121	NaN	NaN	NaN		%	cesavd	
112	113	123	NaN	NaN		%	omega_cbs-sorrow	
113	112	124	NaN	NaN		%	omega_sorrow-cbs	
112	114	125	NaN	NaN		%	omega_cbs-stress	
114	112	126	NaN	NaN		%	omega_stress-cbs	
113	115	127	NaN	NaN		%	omega_sorrow_ps	
114	115	128	NaN	NaN		%	omega_stress-ps	
111	117	129	NaN	NaN		%	omega_srsa_evala	
121	118	130	NaN	NaN		%	omega_psavd_hipp2	
119	121	130	NaN	NaN		%	omega_fsat-psavd	
];

mcwa=[NaN	NaN	NaN	NaN	NaN		%	wspf
NaN	NaN	NaN	NaN	NaN		%	wsnf
NaN	NaN	NaN	NaN	NaN		%	wss
NaN	NaN	NaN	NaN	NaN		%	sspf
NaN	NaN	NaN	NaN	NaN		%	ssnf
NaN	NaN	NaN	NaN	NaN		%	sss
NaN	NaN	NaN	NaN	NaN		%	srspf
NaN	NaN	NaN	NaN	NaN		%	srsnf
NaN	40	NaN	NaN	NaN		%	bs
NaN	NaN	NaN	NaN	NaN		%	pfc
NaN	NaN	NaN	NaN	NaN		%	eval+
NaN	NaN	42	NaN	NaN		%	vent_sat
NaN	NaN	NaN	NaN	NaN		%	eshappy
39	NaN	NaN	NaN	NaN		%	flove
NaN	NaN	NaN	NaN	NaN		%	freward
41	NaN	NaN	NaN	NaN		%	a.insula
NaN	NaN	NaN	NaN	NaN		%	cs
NaN	NaN	NaN	NaN	NaN		%	eval-
45	44	NaN	NaN	NaN		%	psa
NaN	NaN	NaN	NaN	NaN		%	os
NaN	NaN	NaN	NaN	NaN		%	esaction
NaN	NaN	NaN	NaN	NaN		%	wsang
NaN	NaN	NaN	NaN	NaN		%	ssang
NaN	NaN	NaN	NaN	NaN		%	srsang
NaN	NaN	NaN	NaN	NaN		%	psang
NaN	NaN	NaN	NaN	NaN		%	esang
NaN	NaN	NaN	NaN	NaN		%	fsang
NaN	NaN	NaN	NaN	NaN		%	val
NaN	NaN	NaN	NaN	NaN		%	fsemp
NaN	NaN	NaN	NaN	NaN		%	psemp
NaN	NaN	NaN	NaN	NaN		%	wseff
NaN	NaN	NaN	NaN	NaN		%	sseff
43	NaN	NaN	NaN	NaN		%	srseff
NaN	NaN	NaN	NaN	NaN		%	wsanx
NaN	NaN	NaN	NaN	NaN		%	ssanx
NaN	NaN	NaN	NaN	NaN		%	srsanx
NaN	NaN	NaN	NaN	NaN		%	psanx
NaN	NaN	NaN	NaN	NaN		%	fanx
NaN	NaN	NaN	NaN	NaN		%	omega_bs_flove
NaN	NaN	NaN	NaN	NaN		%	omega_flove_bs
NaN	NaN	NaN	NaN	NaN		%	omega_satrium_hipp
NaN	NaN	NaN	NaN	NaN		%	omega_freward_satrium
NaN	NaN	NaN	NaN	NaN		%	omega_psa_srspe
NaN	NaN	NaN	NaN	NaN		%	omega_fsAng_psa
NaN	NaN	NaN	NaN	NaN		%	omega_eval_psa
NaN	NaN	NaN	NaN	NaN		%	Hsrsang,srsanx
NaN	NaN	NaN	NaN	NaN		%	Msrsang,srsanx
NaN	NaN	NaN	NaN	NaN		%	ssh
NaN	NaN	NaN	NaN	NaN		%	srsh
NaN	76	NaN	NaN	NaN		%	c-bs+
NaN	NaN	NaN	NaN	NaN		%	c-PFC
75	NaN	NaN	NaN	NaN		%	c-fslove
NaN	NaN	NaN	NaN	NaN		%	c-fsreward
77	NaN	NaN	NaN	NaN		%	c-insula
NaN	NaN	79	78	NaN		%	c-striatum
NaN	NaN	NaN	NaN	NaN		%	c-eshappy
74	NaN	NaN	NaN	NaN		%	evalh
NaN	81	NaN	NaN	NaN		%	psact
NaN	NaN	NaN	NaN	NaN		%	esact
80	NaN	NaN	NaN	NaN		%	hipp
NaN	NaN	NaN	NaN	NaN		%	fssat
NaN	NaN	NaN	NaN	NaN		%	wss
NaN	NaN	NaN	NaN	NaN		%	sss
NaN	NaN	NaN	NaN	NaN		%	srss
NaN	NaN	NaN	NaN	NaN		%	c-cs
NaN	NaN	NaN	NaN	NaN		%	evals
82	NaN	NaN	NaN	NaN		%	exp
NaN	NaN	NaN	NaN	NaN		%	fsnovel
NaN	NaN	NaN	NaN	NaN		%	em
NaN	NaN	NaN	NaN	NaN		%	urge
NaN	NaN	NaN	NaN	NaN		%	os
NaN	83	84	85	NaN		%	psshare
NaN	NaN	NaN	NaN	NaN		%	esshare
NaN	NaN	NaN	NaN	NaN		%	omega_srsh_evalh
NaN	NaN	NaN	NaN	NaN		%	omega_cbs_fslove
NaN	NaN	NaN	NaN	NaN		%	omega_fslove_cbs
NaN	NaN	NaN	NaN	NaN		%	omega_striatum_insula
NaN	NaN	NaN	NaN	NaN		%	omega_fsreward_striatum
NaN	NaN	NaN	NaN	NaN		%	omega_fslove_striatum
NaN	NaN	NaN	NaN	NaN		%	omega_psact_hipp
NaN	NaN	NaN	NaN	NaN		%	omega_fssat_psact
NaN	NaN	NaN	NaN	NaN		%	omega_pshare_exp
NaN	NaN	NaN	NaN	NaN		%	omega_fsnovel_pshare
NaN	NaN	NaN	NaN	NaN		%	omega_em_pshare
NaN	NaN	NaN	NaN	NaN		%	omega_urge_pshare
NaN	NaN	NaN	NaN	NaN		%	H_srsh_evalh
NaN	NaN	NaN	NaN	NaN		%	H_cbs_fslove
NaN	NaN	NaN	NaN	NaN		%	H_fslove_cbs
NaN	NaN	NaN	NaN	NaN		%	H_striatum_insula
NaN	NaN	NaN	NaN	NaN		%	H_fsreward_striatum
NaN	NaN	NaN	NaN	NaN		%	H_fslove_striatum
NaN	NaN	NaN	NaN	NaN		%	H_psact_hipp
NaN	NaN	NaN	NaN	NaN		%	H_fssat_psact
NaN	NaN	NaN	NaN	NaN		%	H_pshare_exp
NaN	NaN	NaN	NaN	NaN		%	H_fsnovel_pshare
NaN	NaN	NaN	NaN	NaN		%	H_em_pshare
NaN	NaN	NaN	NaN	NaN		%	H_urge_pshare
NaN	NaN	NaN	NaN	NaN		%	M_srsh_evalh
NaN	NaN	NaN	NaN	NaN		%	M_cbs_fslove
NaN	NaN	NaN	NaN	NaN		%	M_fslove_cbs
NaN	NaN	NaN	NaN	NaN		%	M_striatum_insula
NaN	NaN	NaN	NaN	NaN		%	M_fsreward_striatum
NaN	NaN	NaN	NaN	NaN		%	M_fslove_striatum
NaN	NaN	NaN	NaN	NaN		%	M_psact_hipp
NaN	NaN	NaN	NaN	NaN		%	M_fssat_psact
NaN	NaN	NaN	NaN	NaN		%	M_pshare_exp
NaN	NaN	NaN	NaN	NaN		%	M_fsnovel_pshare
NaN	NaN	NaN	NaN	NaN		%	M_em_pshare
NaN	NaN	NaN	NaN	NaN		%	M_urge_pshare
NaN	NaN	NaN	NaN	NaN		%	ssa	
NaN	NaN	NaN	NaN	NaN		%	srsa	
NaN	124	126	NaN	NaN		%	c-bs-	
123	NaN	NaN	NaN	NaN		%	c-fssorrow	
125	NaN	NaN	NaN	NaN		%	c-fsstress	
NaN	127	128	NaN	NaN		%	cpsiso	
NaN	NaN	NaN	NaN	NaN		%	cesiso	
NaN	NaN	NaN	NaN	NaN		%	evald	
130	NaN	NaN	NaN	NaN		%	hipp2	
NaN	NaN	NaN	NaN	NaN		%	fsselfsatisfaction	
NaN	NaN	NaN	NaN	NaN		%	pos	
NaN	131	NaN	NaN	NaN		%	cpsavd	
NaN	NaN	NaN	NaN	NaN		%	cesavd	
NaN	NaN	NaN	NaN	NaN		%	omega_cbs-sorrow	
NaN	NaN	NaN	NaN	NaN		%	omega_sorrow-cbs	
NaN	NaN	NaN	NaN	NaN		%	omega_cbs-stress	
NaN	NaN	NaN	NaN	NaN		%	omega_stress-cbs	
NaN	NaN	NaN	NaN	NaN		%	omega_sorrow_ps	
NaN	NaN	NaN	NaN	NaN		%	omega_stress-ps	
NaN	NaN	NaN	NaN	NaN		%	omega_srsa_evala	
NaN	NaN	NaN	NaN	NaN		%	omega_psavd_hipp2	
NaN	NaN	NaN	NaN	NaN		%	omega_fsat-psavd	

];

msa=[NaN		%	wspf
NaN		%	wsnf
NaN		%	wss
NaN		%	sspf
NaN		%	ssnf
NaN		%	sss
NaN		%	srspf
NaN		%	srsnf
NaN		%	bs
NaN		%	pfc
NaN		%	eval+
NaN		%	vent_sat
NaN		%	eshappy
NaN		%	flove
NaN		%	freward
NaN		%	a.insula
NaN		%	cs
NaN		%	eval-
NaN		%	psa
NaN		%	os
NaN		%	esaction
NaN		%	wsang
NaN		%	ssang
NaN		%	srsang
NaN		%	psang
NaN		%	esang
NaN		%	fsang
NaN		%	val
NaN		%	fsemp
NaN		%	psemp
NaN		%	wseff
NaN		%	sseff
NaN		%	srseff
NaN		%	wsanx
NaN		%	ssanx
NaN		%	srsanx
NaN		%	psanx
NaN		%	fanx
NaN		%	omega_bs_flove
NaN		%	omega_flove_bs
NaN		%	omega_satrium_hipp
NaN		%	omega_freward_satrium
NaN		%	omega_psa_srspe
46		%	omega_fsAng_psa
NaN		%	omega_eval_psa
NaN		%	Hsrsang,srsanx
NaN		%	Msrsang,srsanx
NaN		%	ssh
NaN		%	srsh
NaN		%	c-bs+
NaN		%	c-PFC
NaN		%	c-fslove
NaN		%	c-fsreward
NaN		%	c-insula
NaN		%	c-striatum
NaN		%	c-eshappy
NaN		%	evalh
NaN		%	psact
NaN		%	esact
NaN		%	hipp
NaN		%	fssat
NaN		%	wss
NaN		%	sss
NaN		%	srss
NaN		%	ccs
NaN		%	evals
NaN		%	exp
NaN		%	fsnovel
NaN		%	em
NaN		%	urge
NaN		%	os
NaN		%	psshare
NaN		%	esshare
86		%	omega_srsh_evalh
87		%	omega_cbs_fslove
88		%	omega_fslove_cbs
89		%	omega_striatum_insula
90		%	omega_fsreward_striatum
91		%	omega_fslove_striatum
92		%	omega_psact_hipp
93		%	omega_fssat_psact
94		%	omega_pshare_exp
95		%	omega_fsnovel_pshare
96		%	omega_em_pshare
97		%	omega_urge_pshare
NaN		%	H_srsh_evalh
NaN		%	H_cbs_fslove
NaN		%	H_fslove_cbs
NaN		%	H_striatum_insula
NaN		%	H_fsreward_striatum
NaN		%	H_fslove_striatum
NaN		%	H_psact_hipp
NaN		%	H_fssat_psact
NaN		%	H_pshare_exp
NaN		%	H_fsnovel_pshare
NaN		%	H_em_pshare
NaN		%	H_urge_pshare
NaN		%	M_srsh_evalh
NaN		%	M_cbs_fslove
NaN		%	M_fslove_cbs
NaN		%	M_striatum_insula
NaN		%	M_fsreward_striatum
NaN		%	M_fslove_striatum
NaN		%	M_psact_hipp
NaN		%	M_fssat_psact
NaN		%	M_pshare_exp
NaN		%	M_fsnovel_pshare
NaN		%	M_em_pshare
NaN		%	M_urge_pshare
NaN		%	ssa	
NaN		%	srsa	
NaN		%	c-bs-	
NaN		%	c-fssorrow	
NaN		%	c-fsstress	
NaN		%	cpsiso	
NaN		%	cesiso	
NaN		%	evald	
NaN		%	hipp2	
NaN		%	fsselfsatisfaction	
NaN		%	pos	
NaN		%	cpsavd	
NaN		%	cesavd	
NaN		%	omega_cbs-sorrow	
NaN		%	omega_sorrow-cbs	
NaN		%	omega_cbs-stress	
NaN		%	omega_stress-cbs	
NaN		%	omega_sorrow_ps	
NaN		%	omega_stress-ps	
NaN		%	omega_srsa_evala	
NaN		%	omega_psavd_hipp2	
NaN		%	omega_fsat-psavd	
];
mcfwa=[NaN	NaN	NaN	NaN		%	wspf
NaN	NaN	NaN	NaN		%	wsnf
NaN	NaN	NaN	NaN		%	wss
NaN	NaN	NaN	NaN		%	sspf
NaN	NaN	NaN	NaN		%	ssnf
NaN	NaN	NaN	NaN		%	sss
NaN	NaN	NaN	NaN		%	srspf
NaN	NaN	NaN	NaN		%	srsnf
NaN	NaN	NaN	NaN		%	bs
NaN	NaN	NaN	NaN		%	pfc
NaN	NaN	NaN	NaN		%	eval+
NaN	NaN	NaN	NaN		%	vent_sat
NaN	NaN	NaN	NaN		%	eshappy
NaN	NaN	NaN	NaN		%	flove
NaN	NaN	NaN	NaN		%	freward
NaN	NaN	NaN	NaN		%	a.insula
NaN	NaN	NaN	NaN		%	cs
NaN	NaN	NaN	NaN		%	eval-
NaN	NaN	NaN	NaN		%	psa
NaN	NaN	NaN	NaN		%	os
NaN	NaN	NaN	NaN		%	esaction
NaN	NaN	NaN	NaN		%	wsang
NaN	NaN	NaN	NaN		%	ssang
NaN	NaN	NaN	NaN		%	srsang
NaN	NaN	NaN	NaN		%	psang
NaN	NaN	NaN	NaN		%	esang
NaN	NaN	NaN	NaN		%	fsang
NaN	NaN	NaN	NaN		%	val
NaN	NaN	NaN	NaN		%	fsemp
NaN	NaN	NaN	NaN		%	psemp
NaN	NaN	NaN	NaN		%	wseff
NaN	NaN	NaN	NaN		%	sseff
NaN	NaN	NaN	NaN		%	srseff
NaN	NaN	NaN	NaN		%	wsanx
NaN	NaN	NaN	NaN		%	ssanx
NaN	NaN	NaN	NaN		%	srsanx
NaN	NaN	NaN	NaN		%	psanx
NaN	NaN	NaN	NaN		%	fanx
NaN	NaN	NaN	NaN		%	omega_bs_flove
NaN	NaN	NaN	NaN		%	omega_flove_bs
NaN	NaN	NaN	NaN		%	omega_satrium_hipp
NaN	NaN	NaN	NaN		%	omega_freward_satrium
NaN	NaN	NaN	NaN		%	omega_psa_srspe
NaN	NaN	NaN	NaN		%	omega_fsAng_psa
NaN	NaN	NaN	NaN		%	omega_eval_psa
NaN	NaN	NaN	NaN		%	Hsrsang,srsanx
NaN	NaN	NaN	NaN		%	Msrsang,srsanx
NaN	NaN	NaN	NaN		%	ssh
NaN	NaN	NaN	NaN		%	srsh
NaN	NaN	NaN	NaN		%	c-bs+
NaN	NaN	NaN	NaN		%	c-PFC
NaN	NaN	NaN NaN		%	c-fslove
NaN	NaN	NaN	NaN		%	c-fsreward
NaN	NaN	NaN	NaN		%	c-insula
NaN	NaN	NaN	NaN		%	c-striatum
NaN	NaN	NaN	NaN		%	c-eshappy
NaN	NaN	NaN	NaN		%	evalh
NaN	NaN	NaN	NaN		%	psact
NaN	NaN	NaN	NaN		%	esact
NaN	NaN	NaN	NaN		%	hipp
NaN	NaN	NaN	NaN		%	fssat
NaN	NaN	NaN	NaN		%	wss
NaN	NaN	NaN	NaN		%	sss
NaN	NaN	NaN	NaN		%	srss
NaN	NaN	NaN	NaN		%	ccs
NaN	NaN	NaN	NaN		%	evals
NaN	NaN	NaN	NaN		%	exp
NaN	NaN	NaN	NaN		%	fsnovel
NaN	NaN	NaN	NaN		%	em
NaN	NaN	NaN	NaN		%	urge
NaN	NaN	NaN	NaN		%	os
NaN	NaN	NaN	NaN		%	psshare
NaN	NaN	NaN	NaN		%	esshare
NaN	NaN	NaN	NaN		%	omega_srsh_evalh
NaN	NaN	NaN	NaN		%	omega_cbs_fslove
NaN	NaN	NaN	NaN		%	omega_fslove_cbs
NaN	NaN	NaN	NaN		%	omega_striatum_insula
NaN	NaN	NaN	NaN		%	omega_fsreward_striatum
NaN	NaN	NaN	NaN		%	omega_fslove_striatum
NaN	NaN	NaN	NaN		%	omega_psact_hipp
NaN	NaN	NaN	NaN		%	omega_fssat_psact
NaN	NaN	NaN	NaN		%	omega_pshare_exp
NaN	NaN	NaN	NaN		%	omega_fsnovel_pshare
NaN	NaN	NaN	NaN		%	omega_em_pshare
NaN	NaN	NaN	NaN		%	omega_urge_pshare
NaN	NaN	NaN	NaN		%	H_srsh_evalh
NaN	NaN	NaN	NaN		%	H_cbs_fslove
NaN	NaN	NaN	NaN		%	H_fslove_cbs
NaN	NaN	NaN	NaN		%	H_striatum_insula
NaN	NaN	NaN	NaN		%	H_fsreward_striatum
NaN	NaN	NaN	NaN		%	H_fslove_striatum
NaN	NaN	NaN	NaN		%	H_psact_hipp
NaN	NaN	NaN	NaN		%	H_fssat_psact
NaN	NaN	NaN	NaN		%	H_pshare_exp
NaN	NaN	NaN	NaN		%	H_fsnovel_pshare
NaN	NaN	NaN	NaN		%	H_em_pshare
NaN	NaN	NaN	NaN		%	H_urge_pshare
NaN	NaN	NaN	NaN		%	M_srsh_evalh
NaN	NaN	NaN	NaN		%	M_cbs_fslove
NaN	NaN	NaN	NaN		%	M_fslove_cbs
NaN	NaN	NaN	NaN		%	M_striatum_insula
NaN	NaN	NaN	NaN		%	M_fsreward_striatum
NaN	NaN	NaN	NaN		%	M_fslove_striatum
NaN	NaN	NaN	NaN		%	M_psact_hipp
NaN	NaN	NaN	NaN		%	M_fssat_psact
NaN	NaN	NaN	NaN		%	M_pshare_exp
NaN	NaN	NaN	NaN		%	M_fsnovel_pshare
NaN	NaN	NaN	NaN		%	M_em_pshare
NaN	NaN	NaN	NaN		%	M_urge_pshare
NaN	NaN	NaN	NaN     %	ssa
NaN	NaN	NaN	NaN		%	srsa
NaN	NaN	NaN	NaN		%	c-bs-
NaN	NaN	NaN	NaN		%	c-fssorrow
NaN	NaN	NaN	NaN		%	c-fsstress
NaN	NaN	NaN	NaN		%	cpsiso
NaN	NaN	NaN	NaN		%	cesiso
NaN	NaN	NaN	NaN		%	evald
NaN	NaN	NaN	NaN		%	hipp2
NaN	NaN	NaN	NaN		%	fsselfsatisfaction
NaN	NaN	NaN	NaN		%	pos
NaN	NaN	NaN	NaN		%	cpsavd
NaN	NaN	NaN	NaN		%	cesavd
NaN	NaN	NaN	NaN		%	omega_cbs-sorrow
NaN	NaN	NaN	NaN		%	omega_sorrow-cbs
NaN	NaN	NaN	NaN		%	omega_cbs-stress
NaN	NaN	NaN	NaN		%	omega_stress-cbs
NaN	NaN	NaN	NaN		%	omega_sorrow_ps
NaN	NaN	NaN	NaN		%	omega_stress-ps
NaN	NaN	NaN	NaN		%	omega_srsa_evala
NaN	NaN	NaN	NaN		%	omega_psavd_hipp2
NaN	NaN	NaN	NaN		%	omega_fsat-psavd

];
mcfpa=cat(3,[
%eucl
NaN	NaN	%	wspf
NaN	NaN	%	wsnf
NaN	NaN	%	wss
NaN	NaN	%	sspf
NaN	NaN	%	ssnf
NaN	NaN	%	sss
NaN	NaN	%	srspf
NaN	NaN	%	srsnf
NaN	NaN	%	bs
NaN	NaN	%	pfc
NaN	NaN	%	eval+
NaN	NaN	%	vent_sat
NaN	NaN	%	eshappy
NaN	NaN	%	flove
NaN	NaN	%	freward
NaN	NaN	%	a.insula
NaN	NaN	%	cs
NaN	NaN	%	eval-
NaN	NaN	%	psa
NaN	NaN	%	os
NaN	NaN	%	esaction
NaN	NaN	%	wsang
NaN	NaN	%	ssang
NaN	NaN	%	srsang
NaN	NaN	%	psang
NaN	NaN	%	esang
NaN	NaN	%	fsang
NaN	NaN	%	val
NaN	NaN	%	fsemp
NaN	NaN	%	psemp
NaN	NaN	%	wseff
NaN	NaN	%	sseff
NaN	NaN	%	srseff
NaN	NaN	%	wsanx
NaN	NaN	%	ssanx
NaN	NaN	%	srsanx
NaN	NaN	%	psanx
NaN	NaN	%	fanx
NaN	NaN	%	omega_bs_flove
NaN	NaN	%	omega_flove_bs
NaN	NaN	%	omega_satrium_hipp
NaN	NaN	%	omega_freward_satrium
NaN	NaN	%	omega_psa_srspe
NaN	NaN	%	omega_fsAng_psa
NaN	NaN	%	omega_eval_psa
NaN	NaN	%	Hsrsang,srsanx
NaN	NaN	%	Msrsang,srsanx
NaN	NaN	%	ssh
NaN	NaN	%	srsh
NaN	NaN	%	c-bs+
NaN	NaN	%	c-PFC
NaN	NaN	%	c-fslove
NaN	NaN	%	c-fsreward
NaN	NaN	%	c-insula
NaN	NaN	%	c-striatum
NaN	NaN	%	c-eshappy
NaN	NaN	%	evalh
NaN	NaN	%	psact
NaN	NaN	%	esact
NaN	NaN	%	hipp
NaN	NaN	%	fssat
NaN	NaN	%	wss
NaN	NaN	%	sss
NaN	NaN	%	srss
NaN	NaN	%	ccs
NaN	NaN	%	evals
NaN	NaN	%	exp
NaN	NaN	%	fsnovel
NaN	NaN	%	em
NaN	NaN	%	urge
NaN	NaN	%	os
NaN	NaN	%	psshare
NaN	NaN	%	esshare
NaN	NaN	%	omega_srsh_evalh
NaN	NaN	%	omega_cbs_fslove
NaN	NaN	%	omega_fslove_cbs
NaN	NaN	%	omega_striatum_insula
NaN	NaN	%	omega_fsreward_striatum
NaN	NaN	%	omega_fslove_striatum
NaN	NaN	%	omega_psact_hipp
NaN	NaN	%	omega_fssat_psact
NaN	NaN	%	omega_pshare_exp
NaN	NaN	%	omega_fsnovel_pshare
NaN	NaN	%	omega_em_pshare
NaN	NaN	%	omega_urge_pshare
NaN	NaN	%	H_srsh_evalh
NaN	NaN	%	H_cbs_fslove
NaN	NaN	%	H_fslove_cbs
NaN	NaN	%	H_striatum_insula
NaN	NaN	%	H_fsreward_striatum
NaN	NaN	%	H_fslove_striatum
NaN	NaN	%	H_psact_hipp
NaN	NaN	%	H_fssat_psact
NaN	NaN	%	H_pshare_exp
NaN	NaN	%	H_fsnovel_pshare
NaN	NaN	%	H_em_pshare
NaN	NaN	%	H_urge_pshare
NaN	NaN	%	M_srsh_evalh
NaN	NaN	%	M_cbs_fslove
NaN	NaN	%	M_fslove_cbs
NaN	NaN	%	M_striatum_insula
NaN	NaN	%	M_fsreward_striatum
NaN	NaN	%	M_fslove_striatum
NaN	NaN	%	M_psact_hipp
NaN	NaN	%	M_fssat_psact
NaN	NaN	%	M_pshare_exp
NaN	NaN	%	M_fsnovel_pshare
NaN	NaN	%	M_em_pshare
NaN	NaN	%	M_urge_pshare
NaN	NaN		%	ssa
NaN	NaN		%	srsa
NaN	NaN		%	c-bs-
NaN	NaN		%	c-fssorrow
NaN	NaN		%	c-fsstress
NaN	NaN		%	cpsiso
NaN	NaN		%	cesiso
NaN	NaN		%	evald
NaN	NaN		%	hipp2
NaN	NaN		%	fsselfsatisfaction
NaN	NaN		%	pos
NaN	NaN		%	cpsavd
NaN	NaN		%	cesavd
NaN	NaN		%	omega_cbs-sorrow
NaN	NaN		%	omega_sorrow-cbs
NaN	NaN		%	omega_cbs-stress
NaN	NaN		%	omega_stress-cbs
NaN	NaN		%	omega_sorrow_ps
NaN	NaN		%	omega_stress-ps
NaN	NaN		%	omega_srsa_evala
NaN	NaN		%	omega_psavd_hipp2
NaN	NaN		%	omega_fsat-psavd
%eucl
],[%alog
NaN	NaN	%	wspf
NaN	NaN	%	wsnf
NaN	NaN	%	wss
NaN	NaN	%	sspf
NaN	NaN	%	ssnf
NaN	NaN	%	sss
NaN	NaN	%	srspf
NaN	NaN	%	srsnf
NaN	NaN	%	bs
NaN	NaN	%	pfc
NaN	NaN	%	eval+
NaN	NaN	%	vent_sat
NaN	NaN	%	eshappy
NaN	NaN	%	flove
NaN	NaN	%	freward
NaN	NaN	%	a.insula
NaN	NaN	%	cs
NaN	NaN	%	eval-
NaN	NaN	%	psa
NaN	NaN	%	os
NaN	NaN	%	esaction
NaN	NaN	%	wsang
NaN	NaN	%	ssang
NaN	NaN	%	srsang
NaN	NaN	%	psang
NaN	NaN	%	esang
NaN	NaN	%	fsang
NaN	NaN	%	val
NaN	NaN	%	fsemp
NaN	NaN	%	psemp
NaN	NaN	%	wseff
NaN	NaN	%	sseff
NaN	NaN	%	srseff
NaN	NaN	%	wsanx
NaN	NaN	%	ssanx
NaN	NaN	%	srsanx
NaN	NaN	%	psanx
NaN	NaN	%	fanx
NaN	NaN	%	omega_bs_flove
NaN	NaN	%	omega_flove_bs
NaN	NaN	%	omega_satrium_hipp
NaN	NaN	%	omega_freward_satrium
NaN	NaN	%	omega_psa_srspe
NaN	NaN	%	omega_fsAng_psa
NaN	NaN	%	omega_eval_psa
NaN	NaN	%	Hsrsang,srsanx
NaN	NaN	%	Msrsang,srsanx
NaN	NaN	%	ssh
NaN	NaN	%	srsh
NaN	NaN	%	c-bs+
NaN	NaN	%	c-PFC
NaN	NaN	%	c-fslove
NaN	NaN	%	c-fsreward
NaN	NaN	%	c-insula
NaN	NaN	%	c-striatum
NaN	NaN	%	c-eshappy
NaN	NaN	%	evalh
NaN	NaN	%	psact
NaN	NaN	%	esact
NaN	NaN	%	hipp
NaN	NaN	%	fssat
NaN	NaN	%	wss
NaN	NaN	%	sss
NaN	NaN	%	srss
NaN	NaN	%	ccs
NaN	NaN	%	evals
NaN	NaN	%	exp
NaN	NaN	%	fsnovel
NaN	NaN	%	em
NaN	NaN	%	urge
NaN	NaN	%	os
NaN	NaN	%	psshare
NaN	NaN	%	esshare
NaN	NaN	%	omega_srsh_evalh
NaN	NaN	%	omega_cbs_fslove
NaN	NaN	%	omega_fslove_cbs
NaN	NaN	%	omega_striatum_insula
NaN	NaN	%	omega_fsreward_striatum
NaN	NaN	%	omega_fslove_striatum
NaN	NaN	%	omega_psact_hipp
NaN	NaN	%	omega_fssat_psact
NaN	NaN	%	omega_pshare_exp
NaN	NaN	%	omega_fsnovel_pshare
NaN	NaN	%	omega_em_pshare
NaN	NaN	%	omega_urge_pshare
NaN	NaN	%	H_srsh_evalh
NaN	NaN	%	H_cbs_fslove
NaN	NaN	%	H_fslove_cbs
NaN	NaN	%	H_striatum_insula
NaN	NaN	%	H_fsreward_striatum
NaN	NaN	%	H_fslove_striatum
NaN	NaN	%	H_psact_hipp
NaN	NaN	%	H_fssat_psact
NaN	NaN	%	H_pshare_exp
NaN	NaN	%	H_fsnovel_pshare
NaN	NaN	%	H_em_pshare
NaN	NaN	%	H_urge_pshare
NaN	NaN	%	M_srsh_evalh
NaN	NaN	%	M_cbs_fslove
NaN	NaN	%	M_fslove_cbs
NaN	NaN	%	M_striatum_insula
NaN	NaN	%	M_fsreward_striatum
NaN	NaN	%	M_fslove_striatum
NaN	NaN	%	M_psact_hipp
NaN	NaN	%	M_fssat_psact
NaN	NaN	%	M_pshare_exp
NaN	NaN	%	M_fsnovel_pshare
NaN	NaN	%	M_em_pshare
NaN	NaN	%	M_urge_pshare
NaN	NaN		%	ssa
NaN	NaN		%	srsa
NaN	NaN		%	c-bs-
NaN	NaN		%	c-fssorrow
NaN	NaN		%	c-fsstress
NaN	NaN		%	cpsiso
NaN	NaN		%	cesiso
NaN	NaN		%	evald
NaN	NaN		%	hipp2
NaN	NaN		%	fsselfsatisfaction
NaN	NaN		%	pos
NaN	NaN		%	cpsavd
NaN	NaN		%	cesavd
NaN	NaN		%	omega_cbs-sorrow
NaN	NaN		%	omega_sorrow-cbs
NaN	NaN		%	omega_cbs-stress
NaN	NaN		%	omega_stress-cbs
NaN	NaN		%	omega_sorrow_ps
NaN	NaN		%	omega_stress-ps
NaN	NaN		%	omega_srsa_evala
NaN	NaN		%	omega_psavd_hipp2
NaN	NaN		%	omega_fsat-psavd

%alog
],[%heb
NaN	NaN	%	wspf
NaN	NaN	%	wsnf
NaN	NaN	%	wss
NaN	NaN	%	sspf
NaN	NaN	%	ssnf
NaN	NaN	%	sss
NaN	NaN	%	srspf
NaN	NaN	%	srsnf
NaN	NaN	%	bs
NaN	NaN	%	pfc
NaN	NaN	%	eval+
NaN	NaN	%	vent_sat
NaN	NaN	%	eshappy
NaN	NaN	%	flove
NaN	NaN	%	freward
NaN	NaN	%	a.insula
NaN	NaN	%	cs
NaN	NaN	%	eval-
NaN	NaN	%	psa
NaN	NaN	%	os
NaN	NaN	%	esaction
NaN	NaN	%	wsang
NaN	NaN	%	ssang
NaN	NaN	%	srsang
NaN	NaN	%	psang
NaN	NaN	%	esang
NaN	NaN	%	fsang
NaN	NaN	%	val
NaN	NaN	%	fsemp
NaN	NaN	%	psemp
NaN	NaN	%	wseff
NaN	NaN	%	sseff
NaN	NaN	%	srseff
NaN	NaN	%	wsanx
NaN	NaN	%	ssanx
NaN	NaN	%	srsanx
NaN	NaN	%	psanx
NaN	NaN	%	fanx
NaN	NaN	%	omega_bs_flove
NaN	NaN	%	omega_flove_bs
NaN	NaN	%	omega_satrium_hipp
NaN	NaN	%	omega_freward_satrium
NaN	NaN	%	omega_psa_srspe
47	NaN	%	omega_fsAng_psa
NaN	NaN	%	omega_eval_psa
NaN	NaN	%	Hsrsang,srsanx
NaN	NaN	%	Msrsang,srsanx
NaN	NaN	%	ssh
NaN	NaN	%	srsh
NaN	NaN	%	c-bs+
NaN	NaN	%	c-PFC
NaN	NaN	%	c-fslove
NaN	NaN	%	c-fsreward
NaN	NaN	%	c-insula
NaN	NaN	%	c-striatum
NaN	NaN	%	c-eshappy
NaN	NaN	%	evalh
NaN	NaN	%	psact
NaN	NaN	%	esact
NaN	NaN	%	hipp
NaN	NaN	%	fssat
NaN	NaN	%	wss
NaN	NaN	%	sss
NaN	NaN	%	srss
NaN	NaN	%	ccs
NaN	NaN	%	evals
NaN	NaN	%	exp
NaN	NaN	%	fsnovel
NaN	NaN	%	em
NaN	NaN	%	urge
NaN	NaN	%	os
NaN	NaN	%	psshare
NaN	NaN	%	esshare
98  NaN	%	omega_srsh_evalh
99  NaN		%	omega_cbs_fslove
100 NaN		%	omega_fslove_cbs
101 NaN		%	omega_striatum_insula
102 NaN		%	omega_fsreward_striatum
103 NaN		%	omega_fslove_striatum
104 NaN		%	omega_psact_hipp
105 NaN		%	omega_fssat_psact
106 NaN		%	omega_pshare_exp
107 NaN		%	omega_fsnovel_pshare
108 NaN		%	omega_em_pshare
109 NaN		%	omega_urge_pshare
NaN	NaN	%	H_srsh_evalh
NaN	NaN	%	H_cbs_fslove
NaN	NaN	%	H_fslove_cbs
NaN	NaN	%	H_striatum_insula
NaN	NaN	%	H_fsreward_striatum
NaN	NaN	%	H_fslove_striatum
NaN	NaN	%	H_psact_hipp
NaN	NaN	%	H_fssat_psact
NaN	NaN	%	H_pshare_exp
NaN	NaN	%	H_fsnovel_pshare
NaN	NaN	%	H_em_pshare
NaN	NaN	%	H_urge_pshare
NaN	NaN	%	M_srsh_evalh
NaN	NaN	%	M_cbs_fslove
NaN	NaN	%	M_fslove_cbs
NaN	NaN	%	M_striatum_insula
NaN	NaN	%	M_fsreward_striatum
NaN	NaN	%	M_fslove_striatum
NaN	NaN	%	M_psact_hipp
NaN	NaN	%	M_fssat_psact
NaN	NaN	%	M_pshare_exp
NaN	NaN	%	M_fsnovel_pshare
NaN	NaN	%	M_em_pshare
NaN	NaN	%	M_urge_pshare
NaN	NaN		%	ssa
NaN	NaN		%	srsa
NaN	NaN		%	c-bs-
NaN	NaN		%	c-fssorrow
NaN	NaN		%	c-fsstress
NaN	NaN		%	cpsiso
NaN	NaN		%	cesiso
NaN	NaN		%	evald
NaN	NaN		%	hipp2
NaN	NaN		%	fsselfsatisfaction
NaN	NaN		%	pos
NaN	NaN		%	cpsavd
NaN	NaN		%	cesavd
NaN	NaN		%	omega_cbs-sorrow
NaN	NaN		%	omega_sorrow-cbs
NaN	NaN		%	omega_cbs-stress
NaN	NaN		%	omega_stress-cbs
NaN	NaN		%	omega_sorrow_ps
NaN	NaN		%	omega_stress-ps
NaN	NaN		%	omega_srsa_evala
NaN	NaN		%	omega_psavd_hipp2
NaN	NaN		%	omega_fsat-psavd

%heb
],[%mod
NaN	NaN	%	wspf
NaN	NaN	%	wsnf
NaN	NaN	%	wss
NaN	NaN	%	sspf
NaN	NaN	%	ssnf
NaN	NaN	%	sss
NaN	NaN	%	srspf
NaN	NaN	%	srsnf
NaN	NaN	%	bs
NaN	NaN	%	pfc
NaN	NaN	%	eval+
NaN	NaN	%	vent_sat
NaN	NaN	%	eshappy
NaN	NaN	%	flove
NaN	NaN	%	freward
NaN	NaN	%	a.insula
NaN	NaN	%	cs
NaN	NaN	%	eval-
NaN	NaN	%	psa
NaN	NaN	%	os
NaN	NaN	%	esaction
NaN	NaN	%	wsang
NaN	NaN	%	ssang
NaN	NaN	%	srsang
NaN	NaN	%	psang
NaN	NaN	%	esang
NaN	NaN	%	fsang
NaN	NaN	%	val
NaN	NaN	%	fsemp
NaN	NaN	%	psemp
NaN	NaN	%	wseff
NaN	NaN	%	sseff
NaN	NaN	%	srseff
NaN	NaN	%	wsanx
NaN	NaN	%	ssanx
NaN	NaN	%	srsanx
NaN	NaN	%	psanx
NaN	NaN	%	fanx
NaN	NaN	%	omega_bs_flove
NaN	NaN	%	omega_flove_bs
NaN	NaN	%	omega_satrium_hipp
NaN	NaN	%	omega_freward_satrium
NaN	NaN	%	omega_psa_srspe
NaN	NaN	%	omega_fsAng_psa
NaN	NaN	%	omega_eval_psa
NaN	NaN	%	Hsrsang,srsanx
NaN	NaN	%	Msrsang,srsanx
NaN	NaN	%	ssh
NaN	NaN	%	srsh
NaN	NaN	%	c-bs+
NaN	NaN	%	c-PFC
NaN	NaN	%	c-fslove
NaN	NaN	%	c-fsreward
NaN	NaN	%	c-insula
NaN	NaN	%	c-striatum
NaN	NaN	%	c-eshappy
NaN	NaN	%	evalh
NaN	NaN	%	psact
NaN	NaN	%	esact
NaN	NaN	%	hipp
NaN	NaN	%	fssat
NaN	NaN	%	wss
NaN	NaN	%	sss
NaN	NaN	%	srss
NaN	NaN	%	ccs
NaN	NaN	%	evals
NaN	NaN	%	exp
NaN	NaN	%	fsnovel
NaN	NaN	%	em
NaN	NaN	%	urge
NaN	NaN	%	os
NaN	NaN	%	psshare
NaN	NaN	%	esshare
NaN	NaN	%	omega_srsh_evalh
NaN	NaN	%	omega_cbs_fslove
NaN	NaN	%	omega_fslove_cbs
NaN	NaN	%	omega_striatum_insula
NaN	NaN	%	omega_fsreward_striatum
NaN	NaN	%	omega_fslove_striatum
NaN	NaN	%	omega_psact_hipp
NaN	NaN	%	omega_fssat_psact
NaN	NaN	%	omega_pshare_exp
NaN	NaN	%	omega_fsnovel_pshare
NaN	NaN	%	omega_em_pshare
NaN	NaN	%	omega_urge_pshare
NaN	NaN	%	H_srsh_evalh
NaN	NaN	%	H_cbs_fslove
NaN	NaN	%	H_fslove_cbs
NaN	NaN	%	H_striatum_insula
NaN	NaN	%	H_fsreward_striatum
NaN	NaN	%	H_fslove_striatum
NaN	NaN	%	H_psact_hipp
NaN	NaN	%	H_fssat_psact
NaN	NaN	%	H_pshare_exp
NaN	NaN	%	H_fsnovel_pshare
NaN	NaN	%	H_em_pshare
NaN	NaN	%	H_urge_pshare
NaN	NaN	%	M_srsh_evalh
NaN	NaN	%	M_cbs_fslove
NaN	NaN	%	M_fslove_cbs
NaN	NaN	%	M_striatum_insula
NaN	NaN	%	M_fsreward_striatum
NaN	NaN	%	M_fslove_striatum
NaN	NaN	%	M_psact_hipp
NaN	NaN	%	M_fssat_psact
NaN	NaN	%	M_pshare_exp
NaN	NaN	%	M_fsnovel_pshare
NaN	NaN	%	M_em_pshare
NaN	NaN	%	M_urge_pshare
NaN	NaN		%	ssa
NaN	NaN		%	srsa
NaN	NaN		%	c-bs-
NaN	NaN		%	c-fssorrow
NaN	NaN		%	c-fsstress
NaN	NaN		%	cpsiso
NaN	NaN		%	cesiso
NaN	NaN		%	evald
NaN	NaN		%	hipp2
NaN	NaN		%	fsselfsatisfaction
NaN	NaN		%	pos
NaN	NaN		%	cpsavd
NaN	NaN		%	cesavd
NaN	NaN		%	omega_cbs-sorrow
NaN	NaN		%	omega_sorrow-cbs
NaN	NaN		%	omega_cbs-stress
NaN	NaN		%	omega_stress-cbs
NaN	NaN		%	omega_sorrow_ps
NaN	NaN		%	omega_stress-ps
NaN	NaN		%	omega_srsa_evala
NaN	NaN		%	omega_psavd_hipp2
NaN	NaN		%	omega_fsat-psavd

%mod
]);

mcwv=[1	NaN	NaN	NaN	NaN		%	wspf
1	NaN	NaN	NaN	NaN		%	wsnf
1	NaN	NaN	NaN	NaN		%	wss
0.8	NaN	NaN	NaN	NaN		%	sspf
0.8	NaN	NaN	NaN	NaN		%	ssnf
0.8	NaN	NaN	NaN	NaN		%	sss
0.9	0.15	NaN	NaN	NaN		%	srspf
0.9	0.15	NaN	NaN	NaN		%	srsnf
0.5	NaN	NaN	NaN	NaN		%	bs
0.4	NaN	NaN	NaN	NaN		%	pfc
0.7	0.3	NaN	NaN	NaN		%	eval+
0.2	0.3	NaN	-0.4	NaN		%	vent_sat
0.9	NaN	NaN	NaN	NaN		%	eshappy
NaN	0.4	NaN	NaN	NaN		%	flove
0.5	NaN	NaN	NaN	NaN		%	freward
NaN	NaN	NaN	NaN	NaN		%	a.insula
0.01	0.8	NaN	NaN	NaN		%	cs
0.9	-0.2	NaN	NaN	NaN		%	eval-
NaN	NaN	0.1	NaN	NaN		%	psa
0.8	0.4	0.5	NaN	NaN		%	os
0.9	0.3	0.2	NaN	NaN		%	esaction
-0.4	0.8	NaN	NaN	NaN		%	wsang
0.8	NaN	NaN	NaN	NaN		%	ssang
0.8	NaN	NaN	NaN	NaN		%	srsang
0.4	0.1	0.1	NaN	NaN		%	psang
0.8	NaN	NaN	NaN	NaN		%	esang
0.7	NaN	NaN	NaN	NaN		%	fsang
-0.3	0.3	NaN	NaN	NaN		%	val
0.2	NaN	NaN	NaN	NaN		%	fsemp
0.2	0.1	NaN	NaN	NaN		%	psemp
0.3	NaN	NaN	NaN	NaN		%	wseff
0.3	NaN	NaN	NaN	NaN		%	sseff
NaN	0.3	NaN	NaN	NaN		%	srseff
0.8	NaN	NaN	NaN	NaN		%	wsanx
0.8	NaN	NaN	NaN	NaN		%	ssanx
0.8	NaN	NaN	NaN	NaN		%	srsanx
0.7	0.6	0.4	NaN	NaN		%	psanx
0.8	NaN	NaN	NaN	NaN		%	fanx
1	1	1	NaN	NaN		%	omega_bs_flove
1	1	1	NaN	NaN		%	omega_flove_bs
1	1	1	NaN	NaN		%	omega_satrium_hipp
1	1	1	NaN	NaN		%	omega_freward_satrium
1	1	1	NaN	NaN		%	omega_psa_srspe
1	1	1	NaN	NaN		%	omega_fsAng_psa
1	1	1	NaN	NaN		%	omega_eval_psa
0.8	0.4	1	NaN	NaN		%	Hsrsang,srsanx
-0.1	-0.1	1	NaN	NaN		%	Msrsang,srsanx
0.8	NaN	NaN	NaN	NaN		%	ssh
0.9	NaN	NaN	NaN	NaN		%	srsh
0.8	NaN	NaN	NaN	NaN		%	c-bs+
0.8	NaN	NaN	NaN	NaN		%	c-PFC
NaN	0.7	NaN	NaN	NaN		%	c-fslove
0.7	NaN	NaN	NaN	NaN		%	c-fsreward
NaN	NaN	NaN	NaN	NaN		%	c-insula
0.5	0.5	NaN	NaN	NaN		%	c-striatum
0.8	NaN	NaN	NaN	NaN		%	c-eshappy
NaN	NaN	NaN	NaN	NaN		%	evalh
0.7	NaN	NaN	NaN	NaN		%	psact
0.8	NaN	NaN	NaN	NaN		%	esact
NaN	NaN	NaN	NaN	NaN		%	hipp
0.5	NaN	NaN	NaN	NaN		%	fssat
1	NaN	NaN	NaN	NaN		%	wss
0.8	NaN	NaN	NaN	NaN		%	sss
0.8	NaN	NaN	NaN	NaN		%	srss
0.4	0.7	NaN	NaN	NaN		%	c-cs
-0.2 0.8	NaN	NaN	NaN		%	evals
NaN	NaN	NaN	NaN	NaN		%	exp
1	NaN	NaN	NaN	NaN		%	fsnovel
1	NaN	NaN	NaN	NaN		%	em
1	NaN	NaN	NaN	NaN		%	urge
0.6	0.4	0.2	NaN	NaN		%	os
0.5	NaN	NaN	NaN	NaN		%	psshare
0.5	0.5	NaN	NaN	NaN		%	esshare
1	1	1	NaN	NaN		%	omega_srsh_evalh
1	1	1	NaN	NaN		%	omega_cbs_fslove
1	1	1	NaN	NaN		%	omega_fslove_cbs
1	1	1	NaN	NaN		%	omega_striatum_insula
1	1	1	NaN	NaN		%	omega_fsreward_striatum
1	1	1	NaN	NaN		%	omega_fslove_striatum
1	1	1	NaN	NaN		%	omega_psact_hipp
1	1	1	NaN	NaN		%	omega_fssat_psact
1	1	1	NaN	NaN		%	omega_pshare_exp
1	1	1	NaN	NaN		%	omega_fsnovel_pshare
1	1	1	NaN	NaN		%	omega_em_pshare
1	1	1	NaN	NaN		%	omega_urge_pshare
0.8	0.4	-0.01 1	NaN		%	H_srsh_evalh
0.8	0.4	-0.01 1	NaN		%	H_cbs_fslove
0.8	0.4	-0.01 1	NaN		%	H_fslove_cbs
0.8	0.4	-0.01 1	NaN		%	H_striatum_insula
0.8	0.4	-0.01 1	NaN		%	H_fsreward_striatum
0.8	0.4	-0.01 1	NaN		%	H_fslove_striatum
0.8	0.4	-0.01 1	NaN		%	H_psact_hipp
0.8	0.4	-0.01 1	NaN		%	H_fssat_psact
1	1	1 1	NaN	%	H_pshare_exp
0.8	0.4	-0.01 1	NaN		%	H_fsnovel_pshare
0.8	0.4	-0.01 1	NaN		%	H_em_pshare
1	1	-0.01 1	NaN		%	H_urge_pshare
1   1   1	1	NaN		%	M_srsh_evalh
1   1   1	1	NaN		%	M_cbs_fslove
1   1   1	1	NaN		%	M_fslove_cbs
1   1   1	1	NaN		%	M_striatum_insula
1   1   1	1	NaN		%	M_fsreward_striatum
1   1   1	1	NaN		%	M_fslove_striatum
1   1   1	1	NaN		%	M_psact_hipp
1   1   1	1	NaN		%	M_fssat_psact
1   1   1	1	NaN		%	M_pshare_exp
1	1	1	1	NaN		%	M_fsnovel_pshare
1	1	1	1	NaN		%	M_em_pshare
1	1	1	1	NaN		%	M_urge_pshare
0.9	NaN	NaN	NaN	NaN		%	ssa
1	NaN	NaN	NaN	NaN		%	srsa
0.8	NaN	NaN	NaN	NaN		%	c-bs-
NaN	0.6	NaN	NaN	NaN		%	c-fssorrow
NaN	0.6	NaN	NaN	NaN		%	c-fsstress
0.6	NaN	NaN	NaN	NaN		%	cpsiso
0.6	NaN	NaN	NaN	NaN		%	cesiso
0.6	NaN	NaN	NaN	NaN		%	evald
NaN	NaN	NaN	NaN	NaN		%	hipp2
0.7	NaN	NaN	NaN	NaN		%	fsselfsatisfaction
0.8	0.7	NaN	NaN	NaN		%	pos
0.7	NaN	120	NaN	NaN		%	cpsavd
0.8	121	NaN	NaN	NaN		%	cesavd
1	1	1	NaN	NaN		%	omega_cbs-sorrow
1	1	1	NaN	NaN		%	omega_sorrow-cbs
1	1	1	NaN	NaN		%	omega_cbs-stress
1	1	1	NaN	NaN		%	omega_stress-cbs
1	1	1	NaN	NaN		%	omega_sorrow_ps
1	1	1	NaN	NaN		%	omega_stress-ps
1	1	1	NaN	NaN		%	omega_srsa_evala
1	1	1	NaN	NaN		%	omega_psavd_hipp2
1	1	1	NaN	NaN		%	omega_fsat-psavd

];

mcfwv=[1	NaN	NaN	NaN		%	wspf
1	NaN	NaN	NaN		%	wsnf
1	NaN	NaN	NaN		%	wss
1	NaN	NaN	NaN		%	sspf
1	NaN	NaN	NaN		%	ssnf
1	NaN	NaN	NaN		%	sss
1	NaN	NaN	NaN		%	srspf
NaN	1	NaN	NaN		%	srsnf
NaN	1	NaN	NaN		%	bs
1	NaN	NaN	NaN		%	pfc
1	NaN	NaN	NaN		%	eval+
NaN	1	NaN	NaN		%	vent_sat
NaN	1	NaN	NaN		%	eshappy
NaN	1	NaN	NaN		%	flove
NaN	1	NaN	NaN		%	freward
NaN	1	NaN	NaN		%	a.insula
NaN	1	NaN	NaN		%	cs
1	NaN	NaN	NaN		%	eval-
NaN	1	NaN	NaN		%	psa
1	NaN	NaN	NaN		%	os
1	NaN	NaN	NaN		%	esaction
NaN	1	NaN	NaN		%	wsang
1	NaN	NaN	NaN		%	ssang
1	NaN	NaN	NaN		%	srsang
1	NaN	NaN	NaN		%	psang
1	NaN	NaN	NaN		%	esang
1	NaN	NaN	NaN		%	fsang
NaN	1	NaN	NaN		%	val
1	NaN	NaN	NaN		%	fsemp
NaN	1	NaN	NaN		%	psemp
1	NaN	NaN	NaN		%	wseff
1	NaN	NaN	NaN		%	sseff
NaN	1	NaN	NaN		%	srseff
1	NaN	NaN	NaN		%	wsanx
1	NaN	NaN	NaN		%	ssanx
1	NaN	NaN	NaN		%	srsanx
1	NaN	NaN	NaN		%	psanx
1	NaN	NaN	NaN		%	fanx
NaN	NaN	1	NaN		%	omega_bs_flove
NaN	NaN	1	NaN		%	omega_flove_bs
NaN	NaN	1	NaN		%	omega_satrium_hipp
NaN	NaN	1	NaN		%	omega_freward_satrium
NaN	NaN	1	NaN		%	omega_psa_srspe
NaN	NaN	1	NaN		%	omega_fsAng_psa
NaN	NaN	1	NaN		%	omega_eval_psa
NaN	1	NaN	NaN		%	Hsrsang,srsanx
NaN	1	NaN	NaN		%	Msrsang,srsanx
1	NaN	NaN	NaN		%	ssh
1	NaN	NaN	NaN		%	srsh
NaN	1	NaN	NaN		%	c-bs+
NaN	1	NaN	NaN		%	c-PFC
NaN	1	NaN	NaN		%	c-fslove
NaN	1	NaN	NaN		%	c-fsreward
NaN	1	NaN	NaN		%	c-insula
NaN	1	NaN	NaN		%	c-striatum
1	NaN	NaN	NaN		%	c-eshappy
NaN	1	NaN	NaN		%	evalh
NaN	1	NaN	NaN		%	psact
NaN	1	NaN	NaN		%	esact
NaN	1	NaN	NaN		%	hipp
1	NaN	NaN	NaN		%	fssat
NaN	NaN	NaN	1		%	wss
1	NaN	NaN	NaN		%	sss
1	NaN	NaN	NaN		%	srss
NaN	1	NaN	NaN		%	ccs
NaN	1	NaN	NaN		%	evals
NaN	1	NaN	NaN		%	exp
NaN 1	NaN	NaN		%	fsnovel
NaN	1	NaN	NaN		%	em
NaN	1	NaN	NaN		%	urge
NaN	1	NaN	NaN		%	os
NaN	1	NaN	NaN		%	psshare
NaN	1	NaN	NaN		%	esshare
NaN	NaN	1	NaN		%	omega_srsh_evalh
NaN	NaN	1	NaN		%	omega_cbs_fslove
NaN	NaN	1	NaN		%	omega_fslove_cbs
NaN	NaN	1	NaN		%	omega_striatum_insula
NaN	NaN	1	NaN		%	omega_fsreward_striatum
NaN	NaN	1	NaN		%	omega_fslove_striatum
NaN	NaN	1	NaN		%	omega_psact_hipp
NaN	NaN	1	NaN		%	omega_fssat_psact
NaN	NaN	1	NaN		%	omega_pshare_exp
NaN	NaN	1	NaN		%	omega_fsnovel_pshare
NaN	NaN	1	NaN		%	omega_em_pshare
NaN	NaN	1	NaN		%	omega_urge_pshare
NaN	1	NaN	NaN		%	H_srsh_evalh
NaN	1	NaN	NaN		%	H_cbs_fslove
NaN	1	NaN	NaN		%	H_fslove_cbs
NaN	1	NaN	NaN		%	H_striatum_insula
NaN	1	NaN	NaN		%	H_fsreward_striatum
NaN	1	NaN	NaN		%	H_fslove_striatum
NaN	1	NaN	NaN		%	H_psact_hipp
NaN	1	NaN	NaN		%	H_fssat_psact
NaN	1	NaN	NaN		%	H_pshare_exp
NaN	1	NaN	NaN		%	H_fsnovel_pshare
NaN	1	NaN	NaN		%	H_em_pshare
NaN	1	NaN	NaN		%	H_urge_pshare
NaN	1	NaN	NaN		%	M_srsh_evalh
NaN	1	NaN	NaN		%	M_cbs_fslove
NaN	1	NaN	NaN		%	M_fslove_cbs
NaN	1	NaN	NaN		%	M_striatum_insula
NaN	1	NaN	NaN		%	M_fsreward_striatum
NaN	1	NaN	NaN		%	M_fslove_striatum
NaN	1	NaN	NaN		%	M_psact_hipp
NaN	1	NaN	NaN		%	M_fssat_psact
NaN	1	NaN	NaN		%	M_pshare_exp
NaN	1	NaN	NaN		%	M_fsnovel_pshare
NaN	1	NaN	NaN		%	M_em_pshare
NaN	1	NaN	NaN		%	M_urge_pshare
1	NaN	NaN	NaN		%	ssa
1	NaN	NaN	NaN		%	srsa
NaN	1	NaN	NaN		%	c-bs-
NaN	1	NaN	NaN		%	c-fssorrow
NaN	1	NaN	NaN		%	c-fsstress
NaN	1	NaN	NaN		%	cpsiso
1	NaN	NaN	NaN		%	cesiso
NaN	1	NaN	NaN		%	evald
NaN	1	NaN	NaN		%	hipp2
1	NaN	NaN	NaN		%	fsselfsatisfaction
NaN	1	NaN	NaN		%	pos
NaN	1	NaN	NaN		%	cpsavd
1	NaN	NaN	NaN		%	cesavd
NaN	NaN	1	NaN		%	omega_cbs-sorrow
NaN	NaN	1	NaN		%	omega_sorrow-cbs
NaN	NaN	1	NaN		%	omega_cbs-stress
NaN	NaN	1	NaN		%	omega_stress-cbs
NaN	NaN	1	NaN		%	omega_sorrow_ps
NaN	NaN	1	NaN		%	omega_stress-ps
NaN	NaN	1	NaN		%	omega_srsa_evala
NaN	NaN	1	NaN		%	omega_psavd_hipp2
NaN	NaN	1	NaN		%	omega_fsat-psavd

]; 

mcfpv =cat(3,[
%eucl
1	1	%	wspf
1	1	%	wsnf
1	1	%	wss
1	0.8	%	sspf
1	0.8	%	ssnf
1	0.8	%	sss
2	0.8325	%	srspf
NaN	NaN	%	srsnf
NaN	NaN	%	bs
1	0.4	%	pfc
2	0.58	%	eval+
NaN	NaN	%	vent_sat
NaN	NaN	%	eshappy
NaN	NaN	%	flove
NaN	NaN	%	freward
NaN	NaN	%	a.insula
NaN	NaN	%	cs
1	0.9	%	eval-
NaN	NaN	%	psa
1	1.7	%	os
1	1.4	%	esaction
NaN	NaN	%	wsang
1	0.8	%	ssang
1	0.8	%	srsang
1	0.6	%	psang
1	0.8	%	esang
1	0.7	%	fsang
NaN	NaN	%	val
1	0.2	%	fsemp
NaN	NaN	%	psemp
1	0.3	%	wseff
1	0.3	%	sseff
NaN	NaN	%	srseff
1	0.8	%	wsanx
1	0.8	%	ssanx
1	0.8	%	srsanx
1	1.7	%	psanx
1	0.8	%	fanx
NaN	NaN	%	omega_bs_flove
NaN	NaN	%	omega_flove_bs
NaN	NaN	%	omega_satrium_hipp
NaN	NaN	%	omega_freward_satrium
NaN	NaN	%	omega_psa_srspe
NaN	NaN	%	omega_fsAng_psa
NaN	NaN	%	omega_eval_psa
NaN	NaN	%	Hsrsang,srsanx
NaN	NaN	%	Msrsang,srsanx
1	0.8	%	ssh
1	0.9	%	srsh
NaN	NaN	%	c-bs+
NaN	NaN	%	c-PFC
NaN	NaN	%	c-fslove
NaN	NaN	%	c-fsreward
NaN	NaN	%	c-insula
NaN	NaN	%	c-striatum
1	0.8	%	c-eshappy
NaN	NaN	%	evalh
NaN	NaN	%	psact
NaN	NaN	%	esact
NaN	NaN	%	hipp
1	0.5	%	fssat
NaN	NaN	%	wss
1	0.8	%	sss
1	0.8	%	srss
NaN	NaN	%	ccs
NaN	NaN	%	evals
NaN	NaN	%	exp
NaN	NaN	%	fsnovel
NaN	NaN	%	em
NaN	NaN	%	urge
NaN	NaN	%	os
NaN	NaN	%	psshare
NaN	NaN	%	esshare
NaN	NaN	%	omega_srsh_evalh
NaN	NaN	%	omega_cbs_fslove
NaN	NaN	%	omega_fslove_cbs
NaN	NaN	%	omega_striatum_insula
NaN	NaN	%	omega_fsreward_striatum
NaN	NaN	%	omega_fslove_striatum
NaN	NaN	%	omega_psact_hipp
NaN	NaN	%	omega_fssat_psact
NaN	NaN	%	omega_pshare_exp
NaN	NaN	%	omega_fsnovel_pshare
NaN	NaN	%	omega_em_pshare
NaN	NaN	%	omega_urge_pshare
NaN	NaN	%	H_srsh_evalh
NaN	NaN	%	H_cbs_fslove
NaN	NaN	%	H_fslove_cbs
NaN	NaN	%	H_striatum_insula
NaN	NaN	%	H_fsreward_striatum
NaN	NaN	%	H_fslove_striatum
NaN	NaN	%	H_psact_hipp
NaN	NaN	%	H_fssat_psact
NaN	NaN	%	H_pshare_exp
NaN	NaN	%	H_fsnovel_pshare
NaN	NaN	%	H_em_pshare
NaN	NaN	%	H_urge_pshare
NaN	NaN	%	M_srsh_evalh
NaN	NaN	%	M_cbs_fslove
NaN	NaN	%	M_fslove_cbs
NaN	NaN	%	M_striatum_insula
NaN	NaN	%	M_fsreward_striatum
NaN	NaN	%	M_fslove_striatum
NaN	NaN	%	M_psact_hipp
NaN	NaN	%	M_fssat_psact
NaN	NaN	%	M_pshare_exp
NaN	NaN	%	M_fsnovel_pshare
NaN	NaN	%	M_em_pshare
NaN	NaN	%	M_urge_pshare
1	0.9		%	ssa
1	1		%	srsa
NaN	NaN		%	c-bs-
NaN	NaN		%	c-fssorrow
NaN	NaN		%	c-fsstress
NaN	NaN		%	cpsiso
1	0.6		%	cesiso
NaN	NaN		%	evald
NaN	NaN		%	hipp2
1	0.7		%	fsselfsatisfaction
NaN	NaN		%	pos
NaN	NaN		%	cpsavd
1	121.8		%	cesavd
NaN	NaN		%	omega_cbs-sorrow
NaN	NaN		%	omega_sorrow-cbs
NaN	NaN		%	omega_cbs-stress
NaN	NaN		%	omega_stress-cbs
NaN	NaN		%	omega_sorrow_ps
NaN	NaN		%	omega_stress-ps
NaN	NaN		%	omega_srsa_evala
NaN	NaN		%	omega_psavd_hipp2
NaN	NaN		%	omega_fsat-psavd

%eucl
],[%alog
NaN	NaN	%	wspf
NaN	NaN	%	wsnf
NaN	NaN	%	wss
NaN	NaN	%	sspf
NaN	NaN	%	ssnf
NaN	NaN	%	sss
NaN	NaN	%	srspf
30	0.6	%	srsnf
10	0.2	%	bs
NaN	NaN	%	pfc
NaN	NaN	%	eval+
3	0.2	%	vent_sat
5	0.1	%	eshappy
3	0.6	%	flove
3	0.2	%	freward
3	0.2	%	a.insula
10	0.5	%	cs
NaN	NaN	%	eval-
3	0.4	%	psa
NaN	NaN	%	os
NaN	NaN	%	esaction
10	0.4	%	wsang
NaN	NaN	%	ssang
NaN	NaN	%	srsang
NaN	NaN	%	psang
NaN	NaN	%	esang
NaN	NaN	%	fsang
10	0.2	%	val
NaN	NaN	%	fsemp
3	0.3	%	psemp
NaN	NaN	%	wseff
NaN	NaN	%	sseff
10	0.4	%	srseff
NaN	NaN	%	wsanx
NaN	NaN	%	ssanx
NaN	NaN	%	srsanx
NaN	NaN	%	psanx
NaN	NaN	%	fanx
NaN	NaN	%	omega_bs_flove
NaN	NaN	%	omega_flove_bs
NaN	NaN	%	omega_satrium_hipp
NaN	NaN	%	omega_freward_satrium
NaN	NaN	%	omega_psa_srspe
NaN	NaN	%	omega_fsAng_psa
NaN	NaN	%	omega_eval_psa
3	0.06	%	Hsrsang,srsanx
3	0.05	%	Msrsang,srsanx
NaN	NaN	%	ssh
NaN	NaN	%	srsh
10	0.5	%	c-bs+
10	0.5	%	c-PFC
10	0.5	%	c-fslove
10	0.5	%	c-fsreward
10	0.5	%	c-insula
7	0.9	%	c-striatum
NaN	NaN	%	c-eshappy
5	0.2	%	evalh
8	0.6	%	psact
8	0.6	%	esact
5	0.2	%	hipp
NaN	NaN	%	fssat
NaN	NaN	%	wss
NaN	NaN	%	sss
NaN	NaN	%	srss
11	0.8	%	ccs
5	0.4	%	evals
10  0.1%8	0.05	%	exp
8	0.5	%	fsnovel
7	0.7	%	em
8	0.4	%	urge
5	0.5	%	os
5	0.2	%	psshare
7	0.3	%	esshare
NaN	NaN	%	omega_srsh_evalh
NaN	NaN	%	omega_cbs_fslove
NaN	NaN	%	omega_fslove_cbs
NaN	NaN	%	omega_striatum_insula
NaN	NaN	%	omega_fsreward_striatum
NaN	NaN	%	omega_fslove_striatum
NaN	NaN	%	omega_psact_hipp
NaN	NaN	%	omega_fssat_psact
NaN	NaN	%	omega_pshare_exp
NaN	NaN	%	omega_fsnovel_pshare
NaN	NaN	%	omega_em_pshare
NaN	NaN	%	omega_urge_pshare
3	0.06	%	H_srsh_evalh
6	0.5	%	H_cbs_fslove
3	0.06	%	H_fslove_cbs
3	0.06	%	H_striatum_insula
3	0.06	%	H_fsreward_striatum
3	0.06	%	H_fslove_striatum
2	0.05	%	H_psact_hipp
3	0.02	%	H_fssat_psact
5   2.5%2.4  %	H_pshare_exp
10	1     %	H_fsnovel_pshare
10  0.9	%	H_em_pshare
10  0.8     %	H_urge_pshare
3	0.05	%	M_srsh_evalh
3	0.05	%	M_cbs_fslove
3	0.05	%	M_fslove_cbs
3	0.05	%	M_striatum_insula
3	0.05	%	M_fsreward_striatum
3	0.05	%	M_fslove_striatum
4	0.06	%	M_psact_hipp
3	0.02	%	M_fssat_psact
5   0.5  %	M_pshare_exp
10	0.9     %	M_fsnovel_pshare
10	0.9	%	M_em_pshare
10  0.8     %	M_urge_pshare
NaN	NaN			%	ssa
NaN	NaN			%	srsa
7	0.5			%	c-bs-
7	0.5			%	c-fssorrow
7	0.5			%	c-fsstress
7	0.5			%	cpsiso
NaN	NaN			%	cesiso
7	0.5			%	evald
10	0.2			%	hipp2
NaN	NaN			%	fsselfsatisfaction
7	0.5			%	pos
7	0.5			%	cpsavd
NaN	NaN			%	cesavd
NaN	NaN			%	omega_cbs-sorrow
NaN	NaN			%	omega_sorrow-cbs
NaN	NaN			%	omega_cbs-stress
NaN	NaN			%	omega_stress-cbs
NaN	NaN			%	omega_sorrow_ps
NaN	NaN			%	omega_stress-ps
NaN	NaN			%	omega_srsa_evala
NaN	NaN			%	omega_psavd_hipp2
NaN	NaN			%	omega_fsat-psavd

%alog
],[%heb
NaN	NaN	%	wspf
NaN	NaN	%	wsnf
NaN	NaN	%	wss
NaN	NaN	%	sspf
NaN	NaN	%	ssnf
NaN	NaN	%	sss
NaN	NaN	%	srspf
NaN	NaN	%	srsnf
NaN	NaN	%	bs
NaN	NaN	%	pfc
NaN	NaN	%	eval+
NaN	NaN	%	vent_sat
NaN	NaN	%	eshappy
NaN	NaN	%	flove
NaN	NaN	%	freward
NaN	NaN	%	a.insula
NaN	NaN	%	cs
NaN	NaN	%	eval-
NaN	NaN	%	psa
NaN	NaN	%	os
NaN	NaN	%	esaction
NaN	NaN	%	wsang
NaN	NaN	%	ssang
NaN	NaN	%	srsang
NaN	NaN	%	psang
NaN	NaN	%	esang
NaN	NaN	%	fsang
NaN	NaN	%	val
NaN	NaN	%	fsemp
NaN	NaN	%	psemp
NaN	NaN	%	wseff
NaN	NaN	%	sseff
NaN	NaN	%	srseff
NaN	NaN	%	wsanx
NaN	NaN	%	ssanx
NaN	NaN	%	srsanx
NaN	NaN	%	psanx
NaN	NaN	%	fanx
1	NaN	%	omega_bs_flove
1	NaN	%	omega_flove_bs
1	NaN	%	omega_satrium_hipp
1	NaN	%	omega_freward_satrium
0.7	NaN	%	omega_psa_srspe
NaN	NaN	%	omega_fsAng_psa
1	NaN	%	omega_eval_psa
NaN	NaN	%	Hsrsang,srsanx
NaN	NaN	%	Msrsang,srsanx
NaN	NaN	%	ssh
NaN	NaN	%	srsh
NaN	NaN	%	c-bs+
NaN	NaN	%	c-PFC
NaN	NaN	%	c-fslove
NaN	NaN	%	c-fsreward
NaN	NaN	%	c-insula
NaN	NaN	%	c-striatum
NaN	NaN	%	c-eshappy
NaN	NaN	%	evalh
NaN	NaN	%	psact
NaN	NaN	%	esact
NaN	NaN	%	hipp
NaN	NaN	%	fssat
NaN	NaN	%	wss
NaN	NaN	%	sss
NaN	NaN	%	srss
NaN	NaN	%	ccs
NaN	NaN	%	evals
NaN	NaN	%	exp
NaN	NaN	%	fsnovel
NaN	NaN	%	em
NaN	NaN	%	urge
NaN	NaN	%	os
NaN	NaN	%	psshare
NaN	NaN	%	esshare
NaN	NaN	%	omega_srsh_evalh
NaN	NaN	%	omega_cbs_fslove
NaN	NaN	%	omega_fslove_cbs
NaN	NaN	%	omega_striatum_insula
NaN	NaN	%	omega_fsreward_striatum
NaN	NaN	%	omega_fslove_striatum
NaN	NaN	%	omega_psact_hipp
NaN	NaN	%	omega_fssat_psact
NaN	NaN	%	omega_pshare_exp
NaN	NaN	%	omega_fsnovel_pshare
NaN	NaN	%	omega_em_pshare
NaN	NaN	%	omega_urge_pshare
NaN	NaN	%	H_srsh_evalh
NaN	NaN	%	H_cbs_fslove
NaN	NaN	%	H_fslove_cbs
NaN	NaN	%	H_striatum_insula
NaN	NaN	%	H_fsreward_striatum
NaN	NaN	%	H_fslove_striatum
NaN	NaN	%	H_psact_hipp
NaN	NaN	%	H_fssat_psact
NaN	NaN	%	H_pshare_exp
NaN	NaN	%	H_fsnovel_pshare
NaN	NaN	%	H_em_pshare
NaN	NaN	%	H_urge_pshare
NaN	NaN	%	M_srsh_evalh
NaN	NaN	%	M_cbs_fslove
NaN	NaN	%	M_fslove_cbs
NaN	NaN	%	M_striatum_insula
NaN	NaN	%	M_fsreward_striatum
NaN	NaN	%	M_fslove_striatum
NaN	NaN	%	M_psact_hipp
NaN	NaN	%	M_fssat_psact
NaN	NaN	%	M_pshare_exp
NaN	NaN	%	M_fsnovel_pshare
NaN	NaN	%	M_em_pshare
NaN	NaN	%	M_urge_pshare
NaN	NaN	%	ssa
NaN	NaN	%	srsa
NaN	NaN	%	c-bs-
NaN	NaN	%	c-fssorrow
NaN	NaN	%	c-fsstress
NaN	NaN	%	cpsiso
NaN	NaN	%	cesiso
NaN	NaN	%	evald
NaN	NaN	%	hipp2
NaN	NaN	%	fsselfsatisfaction
NaN	NaN	%	pos
NaN	NaN	%	cpsavd
NaN	NaN	%	cesavd
1	NaN	%	omega_cbs-sorrow
1	NaN	%	omega_sorrow-cbs
1	NaN	%	omega_cbs-stress
1	NaN	%	omega_stress-cbs
1	NaN	%	omega_sorrow_ps
1	NaN	%	omega_stress-ps
1	NaN	%	omega_srsa_evala
1	NaN	%	omega_psavd_hipp2
1	NaN	%	omega_fsat-psavd
%heb
],[%mod
NaN	NaN	%	wspf
NaN	NaN	%	wsnf
NaN	NaN	%	wss
NaN	NaN	%	sspf
NaN	NaN	%	ssnf
NaN	NaN	%	sss
NaN	NaN	%	srspf
NaN	NaN	%	srsnf
NaN	NaN	%	bs
NaN	NaN	%	pfc
NaN	NaN	%	eval+
NaN	NaN	%	vent_sat
NaN	NaN	%	eshappy
NaN	NaN	%	flove
NaN	NaN	%	freward
NaN	NaN	%	a.insula
NaN	NaN	%	cs
NaN	NaN	%	eval-
NaN	NaN	%	psa
NaN	NaN	%	os
NaN	NaN	%	esaction
NaN	NaN	%	wsang
NaN	NaN	%	ssang
NaN	NaN	%	srsang
NaN	NaN	%	psang
NaN	NaN	%	esang
NaN	NaN	%	fsang
NaN	NaN	%	val
NaN	NaN	%	fsemp
NaN	NaN	%	psemp
NaN	NaN	%	wseff
NaN	NaN	%	sseff
NaN	NaN	%	srseff
NaN	NaN	%	wsanx
NaN	NaN	%	ssanx
NaN	NaN	%	srsanx
NaN	NaN	%	psanx
NaN	NaN	%	fanx
NaN	NaN	%	omega_bs_flove
NaN	NaN	%	omega_flove_bs
NaN	NaN	%	omega_satrium_hipp
NaN	NaN	%	omega_freward_satrium
NaN	NaN	%	omega_psa_srspe
NaN	NaN	%	omega_fsAng_psa
NaN	NaN	%	omega_eval_psa
NaN	NaN	%	Hsrsang,srsanx
NaN	NaN	%	Msrsang,srsanx
NaN	NaN	%	ssh
NaN	NaN	%	srsh
NaN	NaN	%	c-bs+
NaN	NaN	%	c-PFC
NaN	NaN	%	c-fslove
NaN	NaN	%	c-fsreward
NaN	NaN	%	c-insula
NaN	NaN	%	c-striatum
NaN	NaN	%	c-eshappy
NaN	NaN	%	evalh
NaN	NaN	%	psact
NaN	NaN	%	esact
NaN	NaN	%	hipp
NaN	NaN	%	fssat
120	60	%	wss
NaN	NaN	%	sss
NaN	NaN	%	srss
NaN	NaN	%	ccs
NaN	NaN	%	evals
NaN	NaN	%	exp
NaN	NaN	%	fsnovel
NaN	NaN	%	em
NaN	NaN	%	urge
NaN	NaN	%	os
NaN	NaN	%	psshare
NaN	NaN	%	esshare
NaN	NaN	%	omega_srsh_evalh
NaN	NaN	%	omega_cbs_fslove
NaN	NaN	%	omega_fslove_cbs
NaN	NaN	%	omega_striatum_insula
NaN	NaN	%	omega_fsreward_striatum
NaN	NaN	%	omega_fslove_striatum
NaN	NaN	%	omega_psact_hipp
NaN	NaN	%	omega_fssat_psact
NaN	NaN	%	omega_pshare_exp
NaN	NaN	%	omega_fsnovel_pshare
NaN	NaN	%	omega_em_pshare
NaN	NaN	%	omega_urge_pshare
NaN	NaN	%	H_srsh_evalh
NaN	NaN	%	H_cbs_fslove
NaN	NaN	%	H_fslove_cbs
NaN	NaN	%	H_striatum_insula
NaN	NaN	%	H_fsreward_striatum
NaN	NaN	%	H_fslove_striatum
NaN	NaN	%	H_psact_hipp
NaN	NaN	%	H_fssat_psact
NaN	NaN	%	H_pshare_exp
NaN	NaN	%	H_fsnovel_pshare
NaN	NaN	%	H_em_pshare
NaN	NaN	%	H_urge_pshare
NaN	NaN	%	M_srsh_evalh
NaN	NaN	%	M_cbs_fslove
NaN	NaN	%	M_fslove_cbs
NaN	NaN	%	M_striatum_insula
NaN	NaN	%	M_fsreward_striatum
NaN	NaN	%	M_fslove_striatum
NaN	NaN	%	M_psact_hipp
NaN	NaN	%	M_fssat_psact
NaN	NaN	%	M_pshare_exp
NaN	NaN	%	M_fsnovel_pshare
NaN	NaN	%	M_em_pshare
NaN	NaN	%	M_urge_pshare
NaN	NaN	%	ssa
NaN	NaN	%	srsa
NaN	NaN	%	c-bs-
NaN	NaN	%	c-fssorrow
NaN	NaN	%	c-fsstress
NaN	NaN	%	cpsiso
NaN	NaN	%	cesiso
NaN	NaN	%	evald
NaN	NaN	%	hipp2
NaN	NaN	%	fsselfsatisfaction
NaN	NaN	%	pos
NaN	NaN	%	cpsavd
NaN	NaN	%	cesavd
NaN	NaN	%	omega_cbs-sorrow
NaN	NaN	%	omega_sorrow-cbs
NaN	NaN	%	omega_cbs-stress
NaN	NaN	%	omega_stress-cbs
NaN	NaN	%	omega_sorrow_ps
NaN	NaN	%	omega_stress-ps
NaN	NaN	%	omega_srsa_evala
NaN	NaN	%	omega_psavd_hipp2
NaN	NaN	%	omega_fsat-psavd

%mod2
]);

msv=[0		%	wspf
0		%	wsnf
1		%	wss
0.6		%	sspf
0.6		%	ssnf
0.6		%	sss
0.6		%	srspf
0.2		%	srsnf
0.2		%	bs
0.6		%	pfc
0.6		%	eval+
0.6		%	vent_sat
0.6		%	eshappy
0.6		%	flove
0.6		%	freward
0.8		%	a.insula
1		%	cs
0.3		%	eval-
0.8		%	psa 
1		%	os
0.04		%	esaction
0.6		%	wsang 
0.6		%	ssang
0.6		%	srsang
0.5		%	psang
0.8		%	esang
0.8		%	fsang
0.1		%	val
0.6		%	fsemp
0.6		%	psemp
0.6		%	wseff
0.6		%	sseff
0.8		%	srseff
0.6		%	wsanx
0.6		%	ssanx
0.6		%	srsanx
0.6		%	psanx
0.6		%	fanx
0.1		%	omega_bs_flove
0.1		%	omega_flove_bs
0.2		%	omega_satrium_hipp
0.2		%	omega_freward_satrium
0.05		%	omega_psa_srspe
NaN		%	omega_fsAng_psa
0.01		%	omega_eval_psa
0.4		%	Hsrsang,srsanx
0.1		%	Msrsang,srsanx
0.8		%	ssh
0.6		%	srsh
0.6		%	c-bs+
0.6		%	c-PFC
0.1		%	c-fslove
0.1		%	c-fsreward
0.1		%	c-insula
0.1		%	c-striatum
0.1		%	c-eshappy
0.05		%	evalh
0.05		%	psact
0.05		%	esact
0.05		%	hipp
0.05		%	fssat
2		%	wss
0.6		%	sss
0.6		%	srss
0.6		%	ccs
0.2		%	evals
0.5		%	exp
0.1		%	fsnovel
0.1		%	em
0.01		%	urge
0.1		%	os
0.3		%	psshare
0.3		%	esshare
NaN		%	omega_srsh_evalh
NaN		%	omega_cbs_fslove
NaN		%	omega_fslove_cbs
NaN		%	omega_striatum_insula
NaN		%	omega_fsreward_striatum
NaN		%	omega_fslove_striatum
NaN		%	omega_psact_hipp
NaN		%	omega_fssat_psact
NaN		%	omega_pshare_exp
NaN		%	omega_fsnovel_pshare
NaN		%	omega_em_pshare
NaN		%	omega_urge_pshare
0.4		%	H_srsh_evalh
0.1		%	H_cbs_fslove
0.1		%	H_fslove_cbs
0.4		%	H_striatum_insula
0.4		%	H_fsreward_striatum
0.4		%	H_fslove_striatum
0.2		%	H_psact_hipp
0.2		%	H_fssat_psact
0.3		%	H_pshare_exp
0.1		%	H_fsnovel_pshare
0.1		%	H_em_pshare
0.1		%	H_urge_pshare
0.2		%	M_srsh_evalh
0.01		%	M_cbs_fslove
0.01		%	M_fslove_cbs
0.2		%	M_striatum_insula
0.2		%	M_fsreward_striatum
0.2		%	M_fslove_striatum
0.02		%	M_psact_hipp
0.02		%	M_fssat_psact
0.35		%	M_pshare_exp
0.01		%	M_fsnovel_pshare
0.01		%	M_em_pshare
0.01		%	M_urge_pshare
0.1		%	ssa	
0.1		%	srsa	
0.1		%	c-bs-	
0.1		%	c-fssorrow	
0.1		%	c-fsstress	
0.05		%	cpsiso	
0.05		%	cesiso	
0.1		%	evald	
0.2		%	hipp2	
0.1		%	fsselfsatisfaction	
0.1		%	pos	
0.01		%	cpsavd	
0.01		%	cesavd	
0.01		%	omega_cbs-sorrow	
0.01		%	omega_sorrow-cbs	
0.01		%	omega_cbs-stress	
0.01		%	omega_stress-cbs	
0.02		%	omega_sorrow_ps	
0.01		%	omega_stress-ps	
0.01		%	omega_srsa_evala	
0.01		%	omega_psavd_hipp2	
0.01		%	omega_fsat-psavd	

];


iv = [0			%	wspf
1			%	wsnf
1			%	wss
0			%	sspf
0			%	ssnf
0			%	sss
0			%	srspf
0			%	srsnf
1			%	bs
0			%	pfc
0			%	eval+
0			%	vent_sat
0			%	eshappy
0			%	flove
0			%	freward
0			%	a.insula
0			%	cs
0			%	eval-
0			%	psa
0			%	os
0			%	esaction
0			%	wsang
0			%	ssang
0			%	srsang
0			%	psang
0			%	esang
0			%	fsang
0			%	val
0			%	fsemp
0			%	psemp
0			%	wseff
0			%	sseff
0			%	srseff
0			%	wsanx
0			%	ssanx
0			%	srsanx
0			%	psanx
0			%	fanx
0.5			%	omega_bs_flove
0.5			%	omega_flove_bs
0.5			%	omega_satrium_hipp
0.6			%	omega_freward_satrium
0.1			%	omega_psa_srspe
0			%	omega_fsAng_psa
0.2			%	omega_eval_psa
0.2			%	Hsrsang,srsanx
0.6			%	Msrsang,srsanx
0			%	ssh
0			%	srsh
0			%	c-bs+
0			%	c-PFC
0			%	c-fslove
0			%	c-fsreward
0			%	c-insula
0			%	c-striatum
0			%	c-eshappy
0			%	evalh
0			%	psact
0			%	esact
0			%	hipp
0			%	fssat
0			%	wss
0			%	sss
0			%	srss
0			%	css
0			%	evals
0			%	exp
0			%	fsnovel
0			%	em
0			%	urge
0			%	os
0			%	psshare
0			%	esshare
0.5			%	omega_srsh_evalh
0.5			%	omega_cbs_fslove
0.5			%	omega_fslove_cbs
0.5			%	omega_striatum_insula
0.5			%	omega_fsreward_striatum
0.5			%	omega_fslove_striatum
0.5			%	omega_psact_hipp
0.5			%	omega_fssat_psact
0.5			%	omega_pshare_exp
0.3			%	omega_fsnovel_pshare
0.3			%	omega_em_pshare
0.3			%	omega_urge_pshare
0.2			%	H_srsh_evalh
0.2			%	H_cbs_fslove
0.2			%	H_fslove_cbs
0.2			%	H_striatum_insula
0.2			%	H_fsreward_striatum
0.2			%	H_fslove_striatum
0.5			%	H_psact_hipp
0.5			%	H_fssat_psact
0.6			%	H_pshare_exp
0.1         %	H_fsnovel_pshare
0.1			%	H_em_pshare
0.1         %	H_urge_pshare
0.1         %	M_srsh_evalh
0.1			%	M_cbs_fslove
0.1			%	M_fslove_cbs
0.6			%	M_striatum_insula
0.6			%	M_fsreward_striatum
0.6			%	M_fslove_striatum
1			%	M_psact_hipp
1			%	M_fssat_psact
0.2			%	M_pshare_exp
0.01			%	M_fsnovel_pshare
0.01			%	M_em_pshare
0.01			%	M_urge_pshare
0			%	ssa	
0			%	srsa	
0.1			%	c-bs-	
0			%	c-fssorrow	
0			%	c-fsstress	
0			%	cpsiso	
0			%	cesiso	
0			%	evald	
0			%	hipp2	
0			%	fsselfsatisfaction	
0			%	pos	
0			%	cpsavd	
0			%	cesavd	
0.2			%	omega_cbs-sorrow	
0.2			%	omega_sorrow-cbs	
0.2			%	omega_cbs-stress	
0.2			%	omega_stress-cbs	
0.2			%	omega_sorrow_ps	
0.2			%	omega_stress-ps	
0.3			%	omega_srsa_evala	
0.3			%	omega_psavd_hipp2	
0.3			%	omega_fsat-psavd	

];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%///////////////////////////////////////////////////%


%\\\\\\\\\\\\\\\\\\ TO BE FILLED \\\\\\\\\\\\\\\\\\\%
%%%%%%%%%%%%% End time and Step size dt %%%%%%%%%%%%%
endtimeofsimulation=500;
dt=0.5;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%///////////////////////////////////////////////////%

% dt is the time difference for each of the steps
% note that the time t is k*dt with k = the number of 
% steps made in the simulation


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% Initialisation for states and time %%%%%%%%
X(:,1)=iv
t(1)=0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%% Setting dimensions %%%%%%%%%%%%%%%%%
nos = numel(iv);
nocf = numel(mcf);
nocfp = size(mcfpv,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This identifies some of the dimensions of the vectors and matrices
% nos = number of states
% nocf = number of combination functions used
% nocfp = number of combination function parameters used

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% Simulation steps %%%%%%%%%%%%%%%%%

for k=1:endtimeofsimulation/dt
    
        % Reading the values from the prespecified matrices representing the 
        % characteristics of the network. As indicated above, these prespecified 
        % matrices are:
        % 1. The base connectivity and nonadaptive values role matrices:
        %       mb, msv, mcwv, mcfwv, mcfpv 
        % for the base connectivity and values of the nonadaptive characteristics   
        % (speed factors, connection weights, combination function 
        % weights, and combination function parameters), and
        % 2. The adaptivity role matrices:
        %       msa,  mcwa,  mcfwa,  mcfpa 
        % for adaptive network characteristics. 
        % If only a NaN value is found in both types of role matrices, 
        % a default value 0 or 1 is chosen.
        
    for j = 1:nos

    if not(isnan(msa(j, 1)))  
        s(j, k) = X(msa(j, 1), k);  
    elseif not(isnan(msv(j, 1))) 
        s(j, k) = msv(j, 1);
    elseif isnan(msv(j, 1)) 
        s(j, k) = 0;
    end

    for p=1:1:size(mb,2)
        if not(isnan(mb(j, p)))
            b(j, p, k) = X(mb(j,p), k);
        elseif isnan(mb(j, p))
            b(j, p, k) = 0;
        end
    end
    for p=1:1:size(mcwv,2)
        if not(isnan(mcwa(j, p)))
            cw(j, p, k) = X(mcwa(j,p), k);
        elseif not(isnan(mcwv(j, p))) 
            cw(j, p, k) = mcwv(j, p);
        elseif isnan(mcwv(j, p)) 
            cw(j, p, k) = 0;
        end
    end
    for m=1:1:nocf
        if not(isnan(mcfwa(j, m)))
            cfw(j, m, k) = X(mcfwa(j, m), k);  
        elseif not(isnan(mcfwv(j, m))) 
            cfw(j, m, k) = mcfwv(j, m);   
        elseif isnan(mcfwv(j, m)) 
            cfw(j, m, k) = 0;
        end
    end
    for p=1:1:nocfp  
        for m=1:1:nocf 
            if not(isnan(mcfpa(j, p, m))) 
                cfp(j, p, m, k) = X(mcfpa(j, p, m), k);  
            elseif not(isnan(mcfpv(j, p, m))) 
                cfp(j, p, m, k) = mcfpv(j, p, m);
            elseif isnan(mcfpv(j, p, m)) 
                cfp(j, p, m, k) = 1;
            end
        end
    end
    
% The actual simulation
            % Next, the actual simulation step follows. 
            % Here, first
            %       squeeze(cw(j, :, k)).*squeeze(b(j, :, k)) 
            % indicates the vector v of single impacts for state j at k
            % used as values in the m-th selected combination function bcf(mcf(m),p,v). 
            % (See Book 2, Chapter 2, Section 2.3.1, Table 2.2, second row)
            % This v is the calculated as the elementwise multiplication of the vectors 
            %       squeeze(cw(j, :, k)) and  squeeze(b(j, :, k))
            % of connection weights and of state values, respectively.
            % Moreover,
            %       squeeze(cfp(j, :, m, k)) 
            % is the vector p of parameter values for combination function
            % bcf(mcf(m),p,v) for state j at k.
            % This calculates the combination function values cfv(j,m,k)for each selected  
            % combination function bcf(mcf(m),p,v) for state j at k
            
        for m=1:1:nocf
            if m == 4
                if j == 62
                    if k == 10
                        x = 10
                    end
                end
            end
                cfv(j,m,k) = bcf(mcf(m), squeeze(cfp(j, :, m, k)), squeeze(cw(j, :, k)).*squeeze(b(j, :, k)));
        end
    
        aggimpact(j, k) = dot(cfw(j, :, k), cfv(j, :, k))/sum(cfw(j, :, k));
            % The aggregated impact for state j at k is calculated as dotproduct (inproduct) of
            % combination function weights and combination function values
            % scaled by the sum of these weights.
            % (See Book 2, Chapter 2, Section 2.3.1, Table 2.2, third row, and formula (2) in Section 2.3.2)
        
        X(j,k+1) = X(j,k) + s(j,k)*(aggimpact(j,k) - X(j,k))*dt;
            % This is the actual iteration step from k to k+1 for state j;
            % (See Book 2, Chapter 2, Section 2.3.1, Table 2.2, third row)
            
        t(k+1) = t(k)+dt;
       end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%\\\\\\\\\\\\\\\\\ TO BE FILLED \\\\\\\\\\\\\\\\\\\\%
%%%%%%%%%%%% Plot graph and store data %%%%%%%%%%%%%%

%%%%%%%%%%new plot for journal

%figure;
%plot([t;t;t;t;t;t;t;t;t;t;t;t;t;t;t;t;t;t;t;t;t;t;t]', [X(26,:);X(110,:);X(111,:);X(112,:);X(113,:);X(114,:);X(115,:);X(116,:);X(117,:);X(118,:);X(119,:);X(120,:);X(121,:);X(122,:);X(123,:);X(124,:);X(125,:);X(126,:);X(127,:);X(128,:);X(129,:);X(130,:);X(131,:)]');


%legend('esang','ssa','srsa','cbs-','cfsforrow','cfsstress','cpsiso','ceiso','evald','hipp2','fstayaway','pos','cpsavd','cesavd','W-cbs-sorrow','Wsorrow-cbs','Wcbs-stress','Wstress-cbs','Wsrs-eval','Wpsavd-hipp2','Wfs-psavd');


figure;
plot([t;t;t;t;t;t;t;t;t;t;t;t;t;t]', [X(26,:);X(110,:);X(111,:);X(112,:);X(113,:);X(114,:);X(115,:);X(116,:);X(123,:);X(124,:);X(125,:);X(126,:);X(127,:);X(128,:)]');


legend('esang','ssa','srsa','cbs-','cfsdep','cfsstr','psiso','eiso','Wcbs-dep','Wdep-cbs','Wcbs-stress','Wstress-cbs','Wdep-ps','Wstress-ps');
% person learning to ignore his parent
figure;
plot([t;t;t;t;t;t;t;t;t;t]', [X(26,:);X(117,:);X(118,:);X(119,:);X(120,:);X(121,:);X(122,:);X(129,:);X(130,:);X(131,:)]');


legend('esang','evald','hipp2','fsself','os','psavd','esavd','Wsrs-eval','Wpsavd-hipp2','Wfs-psavd');



%%%%%%%%%%%%%%%%%% previous plots

% figure;
% plot([t;t;t;t;t;t;t;t;t;t;t;t;t;t;t;t;t;t]', [X(13,:);X(48,:);X(49,:);X(50,:);X(51,:);X(52,:);X(53,:);X(54,:);X(55,:);X(56,:);X(57,:);X(58,:);X(59,:);X(60,:);X(61,:);X(81,:);X(93,:);X(105,:)]')
% 
% 
% legend('eshappy','ssh','srsh','cbs+','cPFC','c-fslove','c-fsreward','c-insula','c-striatum','c-eshappy','evalh','psact','esact','hipp','fssat','fsat-psact-omega','fsat-psact-H','fsat-psact-M')
% 
% figure;
% 
% plot([t;t;t;t;t;t;t;t;t;t;t;t]', [X(74,:);X(75,:);X(76,:);X(77,:);X(78,:);X(79,:);X(80,:);X(81,:);X(82,:);X(83,:);X(84,:); X(85,:)]')
% 
% 
% legend('omega-srsh-evalh','omega-cbs-fslove','omega-fslove-cbs','omega-striatum-insula','omega-fsreward-striatum','omega-fslove-striatum','omega-psact-hipp','omega-fssat-psact','omega-pshare-exp','omega-fsnovel-pshare','omega-em-pshare','omega-urge-pshare')


%CASE I:Child displaying influence of Parent’s Narcissism
%figure;
%plot([t;t;t;t;t;t;t;t;t;t;t;t;t;t;t;t]', [X(26,:);X(13,:);X(48,:);X(49,:);X(50,:);X(51,:);X(52,:);X(53,:);X(54,:);X(55,:);X(56,:);X(75,:);X(76,:);X(77,:);X(78,:);X(79,:)]');


%legend('esang','eshappy','ssh','srsh','cbs+','cPFC','c-fslove','c-fsreward','c-insula','c-striatum','c-eshappy','Wcbs-fslove','Wfslove-cbs','W-striatum-insula','W-fsreward-striatum','Wfslove-striatum');

%Case II: Child learning not to be a Narcissist: 
%figure;
%plot([t;t;t;t;t;t;t;t;t;t;t]', [X(13,:);X(48,:);X(49,:);X(57,:);X(58,:);X(59,:);X(60,:);X(61,:);X(74,:);X(80,:);X(81,:)]');


%legend('eshappy','ssh','srsh','evalh','psact','esact','hipp','fssat','W-srsh-evalh','Wpsact-hipp','Wfssat-psact');












% plot([t;t;t;t;t;t;t;t;t;t;t;t;t;t;t;t;t;t;t;t;t;t;t;t;t;t;t;t;t;t;t;t;t;t;t;t;t;t]', [X(1,:);X(2,:);X(3,:);X(4,:); X(5,:);X(6,:);X(7,:);X(8,:);X(9,:);X(10,:);X(11,:);X(12,:);X(13,:);X(14,:);X(15,:);X(16,:);X(17,:);X(18,:);X(19,:);X(20,:);X(21,:);X(22,:);X(23,:);X(24,:);X(25,:);X(26,:);X(27,:);X(28,:);X(29,:);X(30,:);X(31,:);X(32,:);X(33,:);X(34,:);X(35,:);X(36,:);X(37,:);X(38,:)]')
% legend('wspf','wsnf','wss','sspf','ssnf','sss','srspf','srsnf','bs','PFC','eval+','vent_sat','eshappy','fslove','fsreward','a.insula','cs','eval-','psa','os','esa','wsang','ssang','srsang','psang','esang','fsang','val','fsemp','psemp','wsanx','ssanx','srsanx','psanx','fsanx')


xlswrite('parentalInfluenceOutput.xls',X')



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%///////////////////////////////////////////////////%

    % This generates a graph of the simulation results; note that it has to be
    % indicated which states are displayed; the number of t's should be the same number.
    %%%%%% If you prefer a horizontal legend, leave out the % for the horizontal legend
    %%%%%% If you prefer a vertical legend, leave out the % for the vertical legend
    %%%%%% If you want to have the data in Excel, leave out the % in front of
    %%%%%% the line xlswrite('example.xls',X');
    % You get the simulation data in the xls file 'example.xls' (also other names possible)   
    % which can be opened in Excel and used to make your own graphs, or to just inspect or 
    % analyse the numbers. 
    % Note that this makes the simulation a bit slower as Matlab takes time to write  
    % or read xls data files; also note that during the simulation the xls file  
    % should not be open in Excel, as then it is not writable from Matlab. 
