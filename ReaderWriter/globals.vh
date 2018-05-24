// to be included at top level

reg [ 0 : 0 ] IsBusMaster;			// 1=> master (enable), 0=> slave (disable)
reg [ 16 : 0 ] DecimatorDivider;	// 17 bits to include 100000
reg [ 4 : 0 ] BinAveragingBinSizeId;		// 0..15
reg [ 7 : 0 ] BoxcarBatchSize;	// 0..5
reg BinAveragingIsSet;				// 1=> set, 0=> unset
reg TriggerSourceIsInternal;		// 1=> Internal, 0=> External
reg [ 12 : 0 ] TriggerLevel;		// 0.. 3933 [sic.] -- percent scaled * 100 as integer
reg [ 10 : 0 ] ExtTriggerDelay;	// 0..1000
reg ExtTriggerEdge;					// 0 => Positive, 1 => Negative
reg [ 5 : 0 ] PreTriggerIndex;		// 0..63
reg IsPulseMaster;					// 1 => Enable, 0 => disable
reg [ 31:0 ] GainSetting;			// format unknown [probably less than 32 bits]

reg [ 7 : 0 ] VersionNumberHigh;		//
reg [ 7 : 0 ] VersionNumberLow;		//
