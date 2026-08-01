#!/bin/bash
# ═══════════════════════════════════════════════════════════
# QUARANTINE CLEANUP — MARKS unapproved records
# REVERSIBLE via quarantine_revert.sh
# ═══════════════════════════════════════════════════════════
# WARNING: Requires explicit --approve flag to execute.
# Run:  bash quarantine_cleanup.sh --approve

if [ "$1" != "--approve" ]; then
  echo "ERROR: This script mutates the caller database."
  echo "Review quarantine_report.json first."
  echo "Then run: bash quarantine_cleanup.sh --approve"
  exit 1
fi

echo "Quarantining unapproved records... THIS IS REVERSIBLE."
TOTAL=549
COUNT=0

API="https://www.instaweb.agency/api/caller/leads"

# 1/549: Fuse HVAC, Refrigeration, Electrical & Plumbing
echo "  [1/549] Would quarantine: Fuse HVAC, Refrigeration, Electrical & Plumbing (1e5aa889f0b74733...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='1e5aa889f0b747331076eff852d4ad2c86ce4714151d17830d729884ed86dae1';
COUNT=$((COUNT+1))

# 2/549: Energize NYC
echo "  [2/549] Would quarantine: Energize NYC (2dbe6d607a5094e3...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='2dbe6d607a5094e32779199c98c71001ff198779f0e909b74e0984fc56555753';
COUNT=$((COUNT+1))

# 3/549: Electrician Techs
echo "  [3/549] Would quarantine: Electrician Techs (970b8ca1905e133b...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='970b8ca1905e133bb1e9e7769812c40605bfc4a1e6bb5211123495e7af22f0a7';
COUNT=$((COUNT+1))

# 4/549: Top HVAC NYC
echo "  [4/549] Would quarantine: Top HVAC NYC (0642e038c83a6c8c...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='0642e038c83a6c8c6f9bdf370e6c9c74cd35a444ed70acde6e74016d05192b68';
COUNT=$((COUNT+1))

# 5/549: Electric City
echo "  [5/549] Would quarantine: Electric City (c23ff19aaee1059c...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='c23ff19aaee1059c8dea0439320ebbb5d6c365e778d92e90fe392a65259c8d82';
COUNT=$((COUNT+1))

# 6/549: Elite Power Electric
echo "  [6/549] Would quarantine: Elite Power Electric (6e045c961e499ba9...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='6e045c961e499ba9e8bbbb381b8b4d80dd03e5856003a0df4a0ce7852108e42c';
COUNT=$((COUNT+1))

# 7/549: Electric Lee
echo "  [7/549] Would quarantine: Electric Lee (d6c4ff09df64a7f3...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='d6c4ff09df64a7f32256a1954a40a954f817aed8b501ff0d75a2d05bdccfeef2';
COUNT=$((COUNT+1))

# 8/549: The Electric Connection
echo "  [8/549] Would quarantine: The Electric Connection (48113b5d9580ffc2...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='48113b5d9580ffc28bbceb89e442765d1118b82818080c196320c46cd1b9e55b';
COUNT=$((COUNT+1))

# 9/549: Arizona'\''s Finest Electrical Services
echo "  [9/549] Would quarantine: Arizona'\''s Finest Electrical Services (b33c963409e26247...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='b33c963409e26247a6098355d2355c343b0318e56a7fa8783d575eff24c76d81';
COUNT=$((COUNT+1))

# 10/549: P&L Plumbing
echo "  [10/549] Would quarantine: P&L Plumbing (243757bb2301e3a9...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='243757bb2301e3a97b555f253be400f99a8b523b8ffcb562e68aa100ea13784e';
COUNT=$((COUNT+1))

# 11/549: Transcend Electrical Services LLC
echo "  [11/549] Would quarantine: Transcend Electrical Services LLC (54f6afc2d5f2d9a1...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='54f6afc2d5f2d9a152abe9b2d71bdcac6a16793477df7652af09b594e5bed773';
COUNT=$((COUNT+1))

# 12/549: O'\''Brien Electric LLC
echo "  [12/549] Would quarantine: O'\''Brien Electric LLC (f592ec7e75594b12...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='f592ec7e75594b12904a98d0042f815e2215b4873860a4b9cedb1d24a29e6e91';
COUNT=$((COUNT+1))

# 13/549: CJM Roofing
echo "  [13/549] Would quarantine: CJM Roofing (26486fd87e342a91...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='26486fd87e342a91b79a44919a8ce9ab9c9f31592927f45b40e5a25997424160';
COUNT=$((COUNT+1))

# 14/549: Rapid Rooter Drain Master & Plumbing Experts
echo "  [14/549] Would quarantine: Rapid Rooter Drain Master & Plumbing Experts (5ef69da4185deeec...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='5ef69da4185deeec3d191a4483c37130f81ff54e1bce7d4111675cb19deb09e3';
COUNT=$((COUNT+1))

# 15/549: Sunny Electric
echo "  [15/549] Would quarantine: Sunny Electric (d8b5c4b8bdfd0d0d...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='d8b5c4b8bdfd0d0d34991e1d1d8f9229b7656d2a4f8c3d2cc9b7d809e5ba8c7a';
COUNT=$((COUNT+1))

# 16/549: Buddy Heilig & Sons Electric
echo "  [16/549] Would quarantine: Buddy Heilig & Sons Electric (ade822b9f0db8c70...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='ade822b9f0db8c70581c044e03ebb74a2f9e6eee3c3ffd17463a25b2f05025e0';
COUNT=$((COUNT+1))

# 17/549: Add On Electric
echo "  [17/549] Would quarantine: Add On Electric (af26f6d0912d6101...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='af26f6d0912d6101c614ceb84d77c837e85f52b44a39e37d592309f822f0525b';
COUNT=$((COUNT+1))

# 18/549: Motherroad Plumbing Heating & Cooling
echo "  [18/549] Would quarantine: Motherroad Plumbing Heating & Cooling (996379f644d6d775...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='996379f644d6d7750da6fe4f058c5737b52697e0b8f45d5c1429c82b8a550064';
COUNT=$((COUNT+1))

# 19/549: MONOPOLIZE MILWAUKEE PLUMBING
echo "  [19/549] Would quarantine: MONOPOLIZE MILWAUKEE PLUMBING (9d0921c4ca335247...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='9d0921c4ca3352478342921bcd4a1714da94ef0377b8a83565ebb4b88b770f0d';
COUNT=$((COUNT+1))

# 20/549: Caliber Plumbing
echo "  [20/549] Would quarantine: Caliber Plumbing (7f008cc8ded392df...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='7f008cc8ded392df4fddf278c782a26347c3169ce7b2a738ba4661191e451cbd';
COUNT=$((COUNT+1))

# 21/549: Blau Sudden Service
echo "  [21/549] Would quarantine: Blau Sudden Service (35a440e987a3bce6...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='35a440e987a3bce60842a6217ab5a43d271e33fc45421571f6997bab941eed94';
COUNT=$((COUNT+1))

# 22/549: SJT Plumbing & HVAC
echo "  [22/549] Would quarantine: SJT Plumbing & HVAC (8258984bd1bd8ee4...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='8258984bd1bd8ee44c8e1c93f66cfc31e5acb3ea403caf8fd716765469d0d2a9';
COUNT=$((COUNT+1))

# 23/549: T&T Electrical Services
echo "  [23/549] Would quarantine: T&T Electrical Services (8da67b0f45c3e770...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='8da67b0f45c3e770c75ccc9a705a8368a7e58e665d7963d11c6153756aaee390';
COUNT=$((COUNT+1))

# 24/549: Impel Electric
echo "  [24/549] Would quarantine: Impel Electric (6a5e1c9c384c5a3c...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='6a5e1c9c384c5a3cbabb801b85acce9ff355600b7116bc20123e28b47e32f03a';
COUNT=$((COUNT+1))

# 25/549: Treehouse
echo "  [25/549] Would quarantine: Treehouse (126eaa024d9e4edc...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='126eaa024d9e4edc950a1c232bd43f4e8eeacfb7ceb960b46ed0cba8e8829394';
COUNT=$((COUNT+1))

# 26/549: Pointe Roofing Pros
echo "  [26/549] Would quarantine: Pointe Roofing Pros (1fda298401947f4f...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='1fda298401947f4f1cbb40cca16a77edd4bcb98adef650759842425caead58a4';
COUNT=$((COUNT+1))

# 27/549: Sky Heating and Cooling LLC
echo "  [27/549] Would quarantine: Sky Heating and Cooling LLC (f11e6d2cd70dea73...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='f11e6d2cd70dea73a5722e8bab16aacbdd9c7b09fc7f7f862a5b2a1450c70d10';
COUNT=$((COUNT+1))

# 28/549: Blue Moon Electrical
echo "  [28/549] Would quarantine: Blue Moon Electrical (6869e005ed87904b...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='6869e005ed87904b64756f8d34fbe8e53ecf6140d16650ae2d137ea46940ed0b';
COUNT=$((COUNT+1))

# 29/549: Fuse Service
echo "  [29/549] Would quarantine: Fuse Service (c8e7153761488caa...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='c8e7153761488caaefa0c15a93671601ca80aa9953c7ff28c394dfff7493fe45';
COUNT=$((COUNT+1))

# 30/549: Elite Rooter
echo "  [30/549] Would quarantine: Elite Rooter (651a09d686abaa48...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='651a09d686abaa4856816d740715d0d1ad6906bfcf3bd194b9a97f4f9d312e02';
COUNT=$((COUNT+1))

# 31/549: Bueno Plumbing and Rooter
echo "  [31/549] Would quarantine: Bueno Plumbing and Rooter (32f448e536dbf462...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='32f448e536dbf462ca94f1437b4a6b9c98ae7baa9224f7d87ded22f41478c686';
COUNT=$((COUNT+1))

# 32/549: Allstar Plumbing
echo "  [32/549] Would quarantine: Allstar Plumbing (f8ad9cc362fea4c3...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='f8ad9cc362fea4c37b47e6be22337af3ee3d265020b5a1199e01e008972b7a6d';
COUNT=$((COUNT+1))

# 33/549: Plumbtree Plumbing & Rooter
echo "  [33/549] Would quarantine: Plumbtree Plumbing & Rooter (34cc2c13dd147700...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='34cc2c13dd1477002acb25fde30c7cdfa99997eab55d409dc7101a41121ad500';
COUNT=$((COUNT+1))

# 34/549: Crown Plumbing
echo "  [34/549] Would quarantine: Crown Plumbing (469a19999c94fcd5...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='469a19999c94fcd55517d8a16e537faf2efdff078818e076758bba6c034bc2a1';
COUNT=$((COUNT+1))

# 35/549: Golden Comfort AC & Heating Repair
echo "  [35/549] Would quarantine: Golden Comfort AC & Heating Repair (50aa0fdf57e3f274...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='50aa0fdf57e3f274269e2ac2a795e8de084c2f6b92450eebdce0e85bc01dca01';
COUNT=$((COUNT+1))

# 36/549: DG Heating and Air Conditioning
echo "  [36/549] Would quarantine: DG Heating and Air Conditioning (101e1165d13c03be...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='101e1165d13c03be0971d29150648fdbaedd355087b05f0728e5c9efd44ee502';
COUNT=$((COUNT+1))

# 37/549: Sandium Heating and Air Conditioning
echo "  [37/549] Would quarantine: Sandium Heating and Air Conditioning (e8fe20b64b607054...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='e8fe20b64b6070548d31ad3a1e2b455edaa1856ac879cd9f6ddba8341597f59d';
COUNT=$((COUNT+1))

# 38/549: Air Care Heating & Cooling Inc.
echo "  [38/549] Would quarantine: Air Care Heating & Cooling Inc. (1ddff449f8b8a4e9...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='1ddff449f8b8a4e9a31fe50272e30fc6773cda59813a8569da052fa55a58bd32';
COUNT=$((COUNT+1))

# 39/549: IRBIS HVAC Inc
echo "  [39/549] Would quarantine: IRBIS HVAC Inc (fbe700f7d14983ae...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='fbe700f7d14983ae19f431ad200d821c1b12d98047883b44ac84551200ebb33b';
COUNT=$((COUNT+1))

# 40/549: Plumbing Services of Raleigh
echo "  [40/549] Would quarantine: Plumbing Services of Raleigh (46d5dedb7246da0e...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='46d5dedb7246da0edbfe46f97ede182b555554595d35b80cf180766e0e1d0eb6';
COUNT=$((COUNT+1))

# 41/549: Rinder Electric
echo "  [41/549] Would quarantine: Rinder Electric (9f6c06e82f0af8e7...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='9f6c06e82f0af8e7007d3e9ea4a364ad2fb61fd9a7fea47a6c067c349f7a05d6';
COUNT=$((COUNT+1))

# 42/549: Shorty'\''s Plumbing LLC
echo "  [42/549] Would quarantine: Shorty'\''s Plumbing LLC (a10ad988281bf7b6...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='a10ad988281bf7b650f909d45f6d28041888b229aeaaf855ee70e93221b347fd';
COUNT=$((COUNT+1))

# 43/549: Pro Electric L.C.
echo "  [43/549] Would quarantine: Pro Electric L.C. (72318ab0e33b3b1d...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='72318ab0e33b3b1d93196280a9c18a543142142ff2a8be9d5a89ee97522f4e0c';
COUNT=$((COUNT+1))

# 44/549: Fusion Electric
echo "  [44/549] Would quarantine: Fusion Electric (04f20aa08aae75e7...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='04f20aa08aae75e70c0f8ea2789c8ddb7eee39f367a3bf70a8006b9104e62e2a';
COUNT=$((COUNT+1))

# 45/549: Jeremy Electrical
echo "  [45/549] Would quarantine: Jeremy Electrical (ed0eff47892721e2...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='ed0eff47892721e24abbf18c65e1ec375f46276ef5882fe376abbd80fed5a10d';
COUNT=$((COUNT+1))

# 46/549: Scott The Electrician
echo "  [46/549] Would quarantine: Scott The Electrician (fb0767f92aee508b...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='fb0767f92aee508b324c13a50a32a56422a8c604246dd08d8db75248e965cebb';
COUNT=$((COUNT+1))

# 47/549: Current Solutions Electric
echo "  [47/549] Would quarantine: Current Solutions Electric (7c0f41a486866004...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='7c0f41a486866004478ce683b89eb94f4d742ec52babc054ef25fb861e2e99c6';
COUNT=$((COUNT+1))

# 48/549: JR & Co.
echo "  [48/549] Would quarantine: JR & Co. (a67eb371978372c7...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='a67eb371978372c770385bd38edf2e4ae6bfbb4fc18d1f100a29da2856041984';
COUNT=$((COUNT+1))

# 49/549: Murphy & Sons Roofing, Inc
echo "  [49/549] Would quarantine: Murphy & Sons Roofing, Inc (75182d26f39972bf...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='75182d26f39972bfef9620f641ee8a3f14b1b70c7777ae4aa470e55577c0cfd2';
COUNT=$((COUNT+1))

# 50/549: Century Roofing
echo "  [50/549] Would quarantine: Century Roofing (6a29770f7deccc96...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='6a29770f7deccc962d99ff768b67434a0cabeca1059a1cf8bb6701900ad0146e';
COUNT=$((COUNT+1))

# 51/549: Easton Roofing
echo "  [51/549] Would quarantine: Easton Roofing (c973d965d40a1b58...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='c973d965d40a1b586b76dbd5322292329610228084637a60f306222d026b9b62';
COUNT=$((COUNT+1))

# 52/549: Poor John'\''s Plumbing
echo "  [52/549] Would quarantine: Poor John'\''s Plumbing (91a1a0f5a052c5b8...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='91a1a0f5a052c5b895a256eac4fc9c9eab4ab1603cfa04a723052abde408b9f9';
COUNT=$((COUNT+1))

# 53/549: Quick Relief Plumbing
echo "  [53/549] Would quarantine: Quick Relief Plumbing (aaec178a3df6505f...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='aaec178a3df6505fa4e0ab0f27d863eb495291aefb12f7172c70320742c3b912';
COUNT=$((COUNT+1))

# 54/549: Quality Plumbing Inc
echo "  [54/549] Would quarantine: Quality Plumbing Inc (cf61d3f46ce77be2...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='cf61d3f46ce77be2a30dc02e89dc76f8073206d45884927918fae3abe6795930';
COUNT=$((COUNT+1))

# 55/549: Better Service Heating, Cooling, and Plumbing
echo "  [55/549] Would quarantine: Better Service Heating, Cooling, and Plumbing (41a0abc9b963e9f6...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='41a0abc9b963e9f6f5ef1c853c2291fa430888369de3e5012d81efbcc6979525';
COUNT=$((COUNT+1))

# 56/549: Premier Comfort Heating & Cooling
echo "  [56/549] Would quarantine: Premier Comfort Heating & Cooling (b4725e86dd91c304...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='b4725e86dd91c304c0cb206f5aaad36b0c08d024158e292da09de9dc7f41f739';
COUNT=$((COUNT+1))

# 57/549: A.B. May Heating, A/C, Plumbing & Electrical
echo "  [57/549] Would quarantine: A.B. May Heating, A/C, Plumbing & Electrical (81917a66ef0649ea...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='81917a66ef0649eab5de4a6c11e21c631cdb7fa71d2c35431eb7f0178651e358';
COUNT=$((COUNT+1))

# 58/549: Florida Electrical Services & Contracting
echo "  [58/549] Would quarantine: Florida Electrical Services & Contracting (2759775cab1eedff...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='2759775cab1eedffe3b593d4af000294a02a9f1be4ef34a0dcb7ae2b69335e6b';
COUNT=$((COUNT+1))

# 59/549: Clear Comfort Air Conditioning & Heating – Orlando
echo "  [59/549] Would quarantine: Clear Comfort Air Conditioning & Heating – Orlando (c663627ee896098a...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='c663627ee896098a909d006054ae375684f39c9137fc22eaf733b976900e7685';
COUNT=$((COUNT+1))

# 60/549: Ark & Anchor Electrical, LLC
echo "  [60/549] Would quarantine: Ark & Anchor Electrical, LLC (afc817b3edc52e7d...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='afc817b3edc52e7da2d49d54118e4c5325d73ba578ac3d2c9a5bd53cb67a24a4';
COUNT=$((COUNT+1))

# 61/549: Honesty Electric
echo "  [61/549] Would quarantine: Honesty Electric (d8f758052e69ada9...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='d8f758052e69ada98222de8e64a317a77713221aecede0b19f399d26d0c06ba1';
COUNT=$((COUNT+1))

# 62/549: Charlotte'\''s Best Roofing And Gutters
echo "  [62/549] Would quarantine: Charlotte'\''s Best Roofing And Gutters (d32d26db23b5d28b...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='d32d26db23b5d28b097a322eea8b01fd71208315e9e7733569b3dd653e3810e9';
COUNT=$((COUNT+1))

# 63/549: Signature Exteriors
echo "  [63/549] Would quarantine: Signature Exteriors (547311559d41db32...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='547311559d41db32c007be970c0c1d3551683bd76dae9f2b62eb093a2e2e0dfe';
COUNT=$((COUNT+1))

# 64/549: Electricode
echo "  [64/549] Would quarantine: Electricode (a426ce24e216476e...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='a426ce24e216476efb90ec22731a155e151884f2eb25345b65423b90191fb95a';
COUNT=$((COUNT+1))

# 65/549: Penny Electric
echo "  [65/549] Would quarantine: Penny Electric (99c3b2b2a08de57e...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='99c3b2b2a08de57e4bd7f18ce1509ef30ce36429147f584f4058d1ea983e1070';
COUNT=$((COUNT+1))

# 66/549: Discount Roofing NV LLC
echo "  [66/549] Would quarantine: Discount Roofing NV LLC (f19fae6c37fa342d...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='f19fae6c37fa342db908396dd492a24477322865579c4e1ff9b1eeab22c97939';
COUNT=$((COUNT+1))

# 67/549: Disalvo Roofing LLC
echo "  [67/549] Would quarantine: Disalvo Roofing LLC (5d50defbe31e9f20...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='5d50defbe31e9f2071d77abe4a8c3fd209b80bb65085cba280185934d0fad543';
COUNT=$((COUNT+1))

# 68/549: Impact Plumbing
echo "  [68/549] Would quarantine: Impact Plumbing (1d17bf712a881319...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='1d17bf712a8813197ef1f1af266ba017ac6f7c306875509555b0acaab831b4f2';
COUNT=$((COUNT+1))

# 69/549: Simply Cooling Heating & Plumbing
echo "  [69/549] Would quarantine: Simply Cooling Heating & Plumbing (406ef043ed19ad5c...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='406ef043ed19ad5c318ca5206bbb3b5570d76b30930438a8d4d42da1711bae09';
COUNT=$((COUNT+1))

# 70/549: Fast Affordable Air
echo "  [70/549] Would quarantine: Fast Affordable Air (bcf90ab16b011cb4...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='bcf90ab16b011cb402348774f0341568d70d61d6ec6fc8402b5e61de64d0f9a9';
COUNT=$((COUNT+1))

# 71/549: Electrical Contractors of Georgia
echo "  [71/549] Would quarantine: Electrical Contractors of Georgia (61bcff6d4f858a4d...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='61bcff6d4f858a4d00946d3ad1026d72c71fc419d3bbe239b48e9a965236f1a6';
COUNT=$((COUNT+1))

# 72/549: Morningside Plumbing
echo "  [72/549] Would quarantine: Morningside Plumbing (2372027652e66812...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='2372027652e668121cde963ac8fcac9ebbd2349c20d5e33ac1a24e2ff3505852';
COUNT=$((COUNT+1))

# 73/549: PWR PRO ELECTRIC
echo "  [73/549] Would quarantine: PWR PRO ELECTRIC (eb25d756f32b8731...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='eb25d756f32b873197af3bb6e55fdee46d3cfcc3c6d0c3ea52a989430f73f80f';
COUNT=$((COUNT+1))

# 74/549: Alki Electric LLC
echo "  [74/549] Would quarantine: Alki Electric LLC (2bc67c41aa2d8d16...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='2bc67c41aa2d8d16173610c48a31094c665fbbc1d133bfca677bdd62a7d7a2bd';
COUNT=$((COUNT+1))

# 75/549: Peach Tree Plumbing
echo "  [75/549] Would quarantine: Peach Tree Plumbing (cbbc3121eae0fe69...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='cbbc3121eae0fe69cfca1212775307d2577911ca9bc9ffe931b93ead078150a6';
COUNT=$((COUNT+1))

# 76/549: Miami Electric Masters
echo "  [76/549] Would quarantine: Miami Electric Masters (cff79d9de31cdbcb...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='cff79d9de31cdbcb199fd0eb8d4aaa8342a4020ce694242000a7e72dc8e97229';
COUNT=$((COUNT+1))

# 77/549: Mr. Clog Plumbing
echo "  [77/549] Would quarantine: Mr. Clog Plumbing (3b8a31bded53b4aa...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='3b8a31bded53b4aaed74fe1b9cd22e3575e20eb7f29c93b9b76ec4a675fb3997';
COUNT=$((COUNT+1))

# 78/549: Apollo Electric
echo "  [78/549] Would quarantine: Apollo Electric (33462e098451797c...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='33462e098451797c1ab8ca599ac8680a9db869bd65bc2839c18777d475804170';
COUNT=$((COUNT+1))

# 79/549: H&A Electrician
echo "  [79/549] Would quarantine: H&A Electrician (42c64a4b10c4d2aa...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='42c64a4b10c4d2aa5b94340cd9d7ffe8d7c040cb9bc6a9a8245d0b82984615fb';
COUNT=$((COUNT+1))

# 80/549: Electrician NYC LLC
echo "  [80/549] Would quarantine: Electrician NYC LLC (df72a23a873ee17a...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='df72a23a873ee17ac5fc903f8e51a9ddb5a6439c046ff49ca2297fd6fc238471';
COUNT=$((COUNT+1))

# 81/549: Manhattan Roofing
echo "  [81/549] Would quarantine: Manhattan Roofing (35ef205985a16812...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='35ef205985a16812ceb261e1594b4177a1804c0d7bccc80923cc0685a852340a';
COUNT=$((COUNT+1))

# 82/549: City Roofing Company NYC
echo "  [82/549] Would quarantine: City Roofing Company NYC (6e34c7c582743c59...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='6e34c7c582743c59f6e869c7484568201534fdf7ce211b0ba2e6cfef82430574';
COUNT=$((COUNT+1))

# 83/549: Mr. Plumber
echo "  [83/549] Would quarantine: Mr. Plumber (5b54179b78238f9d...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='5b54179b78238f9d045945b0da5cb633a888201e57eac96a38c7ce9d23144da8';
COUNT=$((COUNT+1))

# 84/549: Pemati Plumbing Services LLC
echo "  [84/549] Would quarantine: Pemati Plumbing Services LLC (9f65d84c8100c75d...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='9f65d84c8100c75dae0292be9a8f30e4aceee9e3851413bea8ec7ff1bdd0be00';
COUNT=$((COUNT+1))

# 85/549: 24 Hr. Emergency Plumbing & Hot Water Heater
echo "  [85/549] Would quarantine: 24 Hr. Emergency Plumbing & Hot Water Heater (cb20afcb22bce4bd...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='cb20afcb22bce4bd1480d82a7c69f1324b744f64f93548a1ee971573b6021dc5';
COUNT=$((COUNT+1))

# 86/549: Rite Plumbing & Heating Inc
echo "  [86/549] Would quarantine: Rite Plumbing & Heating Inc (5f841292a1b47858...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='5f841292a1b478583abe14e5dea8b2dadfd35d9bea6c4b7b477e87b5c97f9705';
COUNT=$((COUNT+1))

# 87/549: A&E NYC Plumbing
echo "  [87/549] Would quarantine: A&E NYC Plumbing (501d73e5837a5bdc...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='501d73e5837a5bdcc34b39fc1984f571f7ca289aae7d8e2bbd6f20bd58daaa77';
COUNT=$((COUNT+1))

# 88/549: Plumbing NYC
echo "  [88/549] Would quarantine: Plumbing NYC (1c40bad892097eb8...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='1c40bad892097eb8401c1f0d06195ca8890f9c8062715c07d2ffa00abe563067';
COUNT=$((COUNT+1))

# 89/549: HVAC Hunters
echo "  [89/549] Would quarantine: HVAC Hunters (9cddfadd11b1b7c1...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='9cddfadd11b1b7c1a87de8cb4ace3ea6c0bfd34d323ffcb8d856a71719717759';
COUNT=$((COUNT+1))

# 90/549: Manhattan HVAC & Appliance Repair Inc
echo "  [90/549] Would quarantine: Manhattan HVAC & Appliance Repair Inc (2e15a6235ee8f4cb...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='2e15a6235ee8f4cbd63ff5109e812d20cd341f025d2b6b7cc50593663df97c5f';
COUNT=$((COUNT+1))

# 91/549: American HVAC Corp - Brooklyn, Heating, Air Conditioning, Refrigeration, Ductless Mini Split, Rooftop, Commercial HVAC NYC
echo "  [91/549] Would quarantine: American HVAC Corp - Brooklyn, Heating, Air Conditioning, Refrigeration, Ductless Mini Split, Rooftop, Commercial HVAC NYC (88645cba8a6c32a9...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='88645cba8a6c32a9028ea348194625524a8fef3fdf4eb0a8933316ccf72affe8';
COUNT=$((COUNT+1))

# 92/549: FLOW HVAC NY | PTAC Installation & Repair NYC
echo "  [92/549] Would quarantine: FLOW HVAC NY | PTAC Installation & Repair NYC (0f69bf8a93631d1b...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='0f69bf8a93631d1b91bf34cb6fa748063f9e690a91d46a036bf28427f23df874';
COUNT=$((COUNT+1))

# 93/549: 24/7 HVAC LOCAL OF MANHATTAN NYC ELITH
echo "  [93/549] Would quarantine: 24/7 HVAC LOCAL OF MANHATTAN NYC ELITH (eb2aa176c5d07f9c...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='eb2aa176c5d07f9ca0a8090bb0dc607d0c74c01661aa72567c349702218466f8';
COUNT=$((COUNT+1))

# 94/549: American HVAC Corp – Top HVAC Contractor NYC
echo "  [94/549] Would quarantine: American HVAC Corp – Top HVAC Contractor NYC (d295be336c9dabec...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='d295be336c9dabece1ac9562cd4f326c0e211bfdc7828ea9c9ebae444141a716';
COUNT=$((COUNT+1))

# 95/549: Thee Electrician LLC
echo "  [95/549] Would quarantine: Thee Electrician LLC (534d9e81920b49ae...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='534d9e81920b49aeb3c3508a4553e620fb00c4a0f31871e79253fd1a27315666';
COUNT=$((COUNT+1))

# 96/549: A 24 Electric Co.
echo "  [96/549] Would quarantine: A 24 Electric Co. (3f69697b1cc46ebc...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='3f69697b1cc46ebce07618c47745c9e6b678db0d52bc43a047065ce0216d25bc';
COUNT=$((COUNT+1))

# 97/549: Sparkye
echo "  [97/549] Would quarantine: Sparkye (4e63d595f72b36bc...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='4e63d595f72b36bc62a13e9aba64f2285f616f89c90084cc061e644dd75d317e';
COUNT=$((COUNT+1))

# 98/549: Max Electric
echo "  [98/549] Would quarantine: Max Electric (db59b57014cebbcb...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='db59b57014cebbcbf189524ed00c1e66ff56bfd805448be06518469931739209';
COUNT=$((COUNT+1))

# 99/549: BV Electric Inc.
echo "  [99/549] Would quarantine: BV Electric Inc. (86ff02af0a26fa7b...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='86ff02af0a26fa7b5856aad63e6aa94bb0e8477910099335368bda3f7691f7c2';
COUNT=$((COUNT+1))

# 100/549: 7x7 Roofing
echo "  [100/549] Would quarantine: 7x7 Roofing (620ac4c95dcce990...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='620ac4c95dcce99061a83236d2a7b307fa87864c9dd41a0c3a7c9c8931811d71';
COUNT=$((COUNT+1))

# 101/549: One Roofing
echo "  [101/549] Would quarantine: One Roofing (ea271916d7bf8d9a...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='ea271916d7bf8d9a6d7ca3d506c069c2c4195f04788917e4afc12a16bf21b17e';
COUNT=$((COUNT+1))

# 102/549: ROOF EXPRESS
echo "  [102/549] Would quarantine: ROOF EXPRESS (8461313f8cd8a822...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='8461313f8cd8a8222f7b05ed6360b48a12a1063ea7161db4813f540f5dc4e2bb';
COUNT=$((COUNT+1))

# 103/549: ELM Roofing Contractors Inc
echo "  [103/549] Would quarantine: ELM Roofing Contractors Inc (68f98e8960397ca2...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='68f98e8960397ca219032860547343cf1994deb8ac28bcdcf4a4cf40f2254581';
COUNT=$((COUNT+1))

# 104/549: Marina Bay Roofing
echo "  [104/549] Would quarantine: Marina Bay Roofing (15052c3e2b968e90...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='15052c3e2b968e90b7eee8f34aad5527a124d8ec3c6ea600a55608dc6b035e35';
COUNT=$((COUNT+1))

# 105/549: Air Flow Pros Heating and Air Conditioning
echo "  [105/549] Would quarantine: Air Flow Pros Heating and Air Conditioning (10f2725e66557132...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='10f2725e66557132328e53bff0ba50176942a1cb36cb1ee976773a1a003ecaed';
COUNT=$((COUNT+1))

# 106/549: Heating And Air Experts
echo "  [106/549] Would quarantine: Heating And Air Experts (fc12489c88087937...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='fc12489c88087937c12e21abba895720480ae84dbe8a8471c039e62b538cda75';
COUNT=$((COUNT+1))

# 107/549: Magic Plumbing Heating & Cooling
echo "  [107/549] Would quarantine: Magic Plumbing Heating & Cooling (46fdcbb9095a0fd7...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='46fdcbb9095a0fd7f12ad3230a2d297ff16efd0a6a592b8ad9e75aa7d9e6f989';
COUNT=$((COUNT+1))

# 108/549: Sweeney Electric
echo "  [108/549] Would quarantine: Sweeney Electric (7a92bfba2226c872...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='7a92bfba2226c8727d4b864482fe510ee2cd8fc466f2cb7f560e4708aae1567f';
COUNT=$((COUNT+1))

# 109/549: Bright Power Electric
echo "  [109/549] Would quarantine: Bright Power Electric (5f52d4707e16e5ce...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='5f52d4707e16e5ce1e0a8e6d348adca11ec71f0696982fe554770fa478ef5f26';
COUNT=$((COUNT+1))

# 110/549: Point Loma Electric, Plumbing, Heating & Air
echo "  [110/549] Would quarantine: Point Loma Electric, Plumbing, Heating & Air (30cc757c57c451f7...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='30cc757c57c451f7fdd2fb27f9c5a169791da89373c9bf2dd6b2fc994f3a929d';
COUNT=$((COUNT+1))

# 111/549: SRP Electric Inc.
echo "  [111/549] Would quarantine: SRP Electric Inc. (11983f97de4306f4...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='11983f97de4306f4e6fe1a8b6d56bcee1b184e987e7eea3fbd21864c757286d5';
COUNT=$((COUNT+1))

# 112/549: Resilient Roofing
echo "  [112/549] Would quarantine: Resilient Roofing (9679f17c86d2d01c...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='9679f17c86d2d01c47b71deec99f889c408850beaea0e190db308a8b1f61a773';
COUNT=$((COUNT+1))

# 113/549: Alma Roofing
echo "  [113/549] Would quarantine: Alma Roofing (ce3dc19df88fceba...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='ce3dc19df88fceba59dcd1aeee074a3bf8dcfd843f144c01da7b8e1ae92ec867';
COUNT=$((COUNT+1))

# 114/549: 619 Roofing
echo "  [114/549] Would quarantine: 619 Roofing (e6b00ae1f530d5b7...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='e6b00ae1f530d5b7c91e157fe1718b7fb1d091c96b2e045942ed57e263eeac07';
COUNT=$((COUNT+1))

# 115/549: Plumbing Tree
echo "  [115/549] Would quarantine: Plumbing Tree (674c96c33d7cc3d7...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='674c96c33d7cc3d7cf49466f442087e2906e6a14fc1128dacc77f5f353b09e77';
COUNT=$((COUNT+1))

# 116/549: Elite Rooter Plumbers
echo "  [116/549] Would quarantine: Elite Rooter Plumbers (98bce8804499e78a...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='98bce8804499e78ab7d8a871e7d6a3180d6e5fedb7de3281b9134984ab2630f4';
COUNT=$((COUNT+1))

# 117/549: Black Mountain Plumbing
echo "  [117/549] Would quarantine: Black Mountain Plumbing (114996f6c014ebff...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='114996f6c014ebff06a49b63f39fbd4da4fc85ffadbd4fd672fbdcdb72342e2a';
COUNT=$((COUNT+1))

# 118/549: Core Plumbing
echo "  [118/549] Would quarantine: Core Plumbing (f240ee750a35ac3c...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='f240ee750a35ac3c4ec3d1190473585f0616c50bc82b433091e8345afe91ad7e';
COUNT=$((COUNT+1))

# 119/549: Smith & Sons Heating and Air Inc.
echo "  [119/549] Would quarantine: Smith & Sons Heating and Air Inc. (a57e2549eadf1530...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='a57e2549eadf1530ca3d48c116ced3f1d6aaf7af98ac1d07eb20b0ef8293f786';
COUNT=$((COUNT+1))

# 120/549: Comfort Air Conditioning & Heating
echo "  [120/549] Would quarantine: Comfort Air Conditioning & Heating (1fcca117db877277...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='1fcca117db877277ca791850ac56725015ce1af98693585ea45f0dd81d716755';
COUNT=$((COUNT+1))

# 121/549: EZ Breezy Heating & Air
echo "  [121/549] Would quarantine: EZ Breezy Heating & Air (65587bd04dab90cc...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='65587bd04dab90cc7d1f30089a6fd136dc40e81266e1d3ff11fd8d5e86263304';
COUNT=$((COUNT+1))

# 122/549: Stable Temp HVAC
echo "  [122/549] Would quarantine: Stable Temp HVAC (b7d7d3c2a05781e1...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='b7d7d3c2a05781e12c851e7d1fc42fcef11ea1d5284dcc45d40f6674e82b3b8a';
COUNT=$((COUNT+1))

# 123/549: All Things Roofing LA
echo "  [123/549] Would quarantine: All Things Roofing LA (6b00e161b328dd83...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='6b00e161b328dd834682bcbec704957f98c5d3ffa598a6725f2cf8a0b593dbe8';
COUNT=$((COUNT+1))

# 124/549: The Local Roofers Builder
echo "  [124/549] Would quarantine: The Local Roofers Builder (1aaf9c4d65e15dd6...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='1aaf9c4d65e15dd64ce5ecc72f592f1cc3a2f4ba53e8c6d236a8334f0d043fff';
COUNT=$((COUNT+1))

# 125/549: Quality Roofing Specialists
echo "  [125/549] Would quarantine: Quality Roofing Specialists (d48f4298ecdcb5d4...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='d48f4298ecdcb5d40962047e947f4274ff66cc3c5ec42c5a26dc17ff3455bf4d';
COUNT=$((COUNT+1))

# 126/549: Francisco'\''s Roofing Inc.
echo "  [126/549] Would quarantine: Francisco'\''s Roofing Inc. (1d8a06669ccb6781...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='1d8a06669ccb678150b796b65a5f2326ed5c59056dc720cc7c4f97d149aa685b';
COUNT=$((COUNT+1))

# 127/549: All In Roofing
echo "  [127/549] Would quarantine: All In Roofing (bb11f86eb5bbdfe2...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='bb11f86eb5bbdfe262d6673dfd48dc89e5452bbb3ee6966ef683df0198bcff94';
COUNT=$((COUNT+1))

# 128/549: Pacific Plumbing Team
echo "  [128/549] Would quarantine: Pacific Plumbing Team (e7f62613d53720c0...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='e7f62613d53720c0e4ef9b3ff3d2e8ca0b82bb0bc05008f9aa8ac0004d4b49b3';
COUNT=$((COUNT+1))

# 129/549: Precise Air Systems Inc.
echo "  [129/549] Would quarantine: Precise Air Systems Inc. (2fe81df4e66d88f5...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='2fe81df4e66d88f5dcaa2a4fb1a486cd1b18dd9acadfeb2049916dc58122f82e';
COUNT=$((COUNT+1))

# 130/549: Southwest Heating & Air Conditioning
echo "  [130/549] Would quarantine: Southwest Heating & Air Conditioning (9134c9a2bbccd367...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='9134c9a2bbccd367bff6f5a556cb086cbe3ef06f27e5e5fdb773678461cfaf66';
COUNT=$((COUNT+1))

# 131/549: LC Heating & Air Conditioning
echo "  [131/549] Would quarantine: LC Heating & Air Conditioning (25cc2a516f5f5667...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='25cc2a516f5f566792dfbafc0a3566834342557135cf6b949a281f8973180c56';
COUNT=$((COUNT+1))

# 132/549: Brody Pennell Heating & Air Conditioning
echo "  [132/549] Would quarantine: Brody Pennell Heating & Air Conditioning (f192d86eadb0afba...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='f192d86eadb0afba6748234790b8dec6777c6aab1c7f074667a3ea3178761144';
COUNT=$((COUNT+1))

# 133/549: Empowered Electrical Solutions
echo "  [133/549] Would quarantine: Empowered Electrical Solutions (1c956ce95166c373...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='1c956ce95166c373bc6e6c34a06fcd07006b805593af8861c46ab3d2ba72826b';
COUNT=$((COUNT+1))

# 134/549: Volthouse Electric
echo "  [134/549] Would quarantine: Volthouse Electric (d38e1b86db911f86...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='d38e1b86db911f86ecddbca157ba827f558a1adce03476518c2ac0694b42d300';
COUNT=$((COUNT+1))

# 135/549: Allgood Electric
echo "  [135/549] Would quarantine: Allgood Electric (bca859082b10e782...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='bca859082b10e782c6152776288e24090fc74b6fb192734cafcd1d8d4cd0f0ba';
COUNT=$((COUNT+1))

# 136/549: Blueline Heating & Air Conditioning LLC
echo "  [136/549] Would quarantine: Blueline Heating & Air Conditioning LLC (79adac87d5b43ce7...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='79adac87d5b43ce7978d8e189beb46f8b5bf3af3edfdbca6e9ce0f9cebafac80';
COUNT=$((COUNT+1))

# 137/549: Lex - Air Conditioning, Heating, Plumbing, Electrical
echo "  [137/549] Would quarantine: Lex - Air Conditioning, Heating, Plumbing, Electrical (ee91d3ec4b3cbd56...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='ee91d3ec4b3cbd56c8bc498cdbaee4f0efd59aafc8eca7f7e59e7ae247fb6858';
COUNT=$((COUNT+1))

# 138/549: Roof Repair Solutions
echo "  [138/549] Would quarantine: Roof Repair Solutions (e3660416d1783db8...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='e3660416d1783db8b159650279def718756d9df4171e2f98beaf09bb1e68d2d6';
COUNT=$((COUNT+1))

# 139/549: Detroit Roofers
echo "  [139/549] Would quarantine: Detroit Roofers (f4848ed107841e1b...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='f4848ed107841e1ba266f0ef6bb6260289c534795f24b50dd9177e51b5ca4142';
COUNT=$((COUNT+1))

# 140/549: The Detroit Roofing Company
echo "  [140/549] Would quarantine: The Detroit Roofing Company (741e873e1e251966...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='741e873e1e2519666c12a9ad832753fffd2e2dc422865d4a1a101cc85f855227';
COUNT=$((COUNT+1))

# 141/549: The Heating and Cooling Company Of Detroit
echo "  [141/549] Would quarantine: The Heating and Cooling Company Of Detroit (0a60e15f0d3dd131...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='0a60e15f0d3dd1311380b80c23d662fa70afe15c37ce0238ddc9ba88ae2e5ca7';
COUNT=$((COUNT+1))

# 142/549: JD Cooling
echo "  [142/549] Would quarantine: JD Cooling (e4b0c3a3be96bc8e...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='e4b0c3a3be96bc8ea1e4a6133a596d7e51a0121aa7d3b92dd7fb96f1223c25b7';
COUNT=$((COUNT+1))

# 143/549: Maxx A/C & Heating
echo "  [143/549] Would quarantine: Maxx A/C & Heating (d1767e3f8da0ccb2...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='d1767e3f8da0ccb2cc5b915746dbc608e7d44ed32196f80787bf8a1ff48b61c9';
COUNT=$((COUNT+1))

# 144/549: Brown Air Conditioning and Heating
echo "  [144/549] Would quarantine: Brown Air Conditioning and Heating (d85fd2f0c4620a68...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='d85fd2f0c4620a682097b13dd5d9aac883f706fcdfc00818aa378f7252a92431';
COUNT=$((COUNT+1))

# 145/549: Air Dynasty AC & Heating
echo "  [145/549] Would quarantine: Air Dynasty AC & Heating (c298ca5aa022e31e...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='c298ca5aa022e31e7220fab7f4ab7c7ad1b3ffef7c18874d80d4b2bd8e86fb6f';
COUNT=$((COUNT+1))

# 146/549: Air Check Mechanical Services
echo "  [146/549] Would quarantine: Air Check Mechanical Services (61378a3c1b2444ee...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='61378a3c1b2444ee9db93e81ce17ea64aa98262f3c1faee1e389988a597c4a44';
COUNT=$((COUNT+1))

# 147/549: Marcos AC & Heating
echo "  [147/549] Would quarantine: Marcos AC & Heating (1ef06191081b9f76...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='1ef06191081b9f769bdb0806aa4d8e695ea6990e4ac8557781f04e2a5f9f0901';
COUNT=$((COUNT+1))

# 148/549: GotFlow Plumbing & AC
echo "  [148/549] Would quarantine: GotFlow Plumbing & AC (e928585b29518422...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='e928585b2951842286856bc91dd9714abaf5f0d26f9033a7964ddb8a0d5e0166';
COUNT=$((COUNT+1))

# 149/549: Rapid Heating & Air
echo "  [149/549] Would quarantine: Rapid Heating & Air (f7f1057a5861b5f7...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='f7f1057a5861b5f7ce4356341f17868c0dcffdec94eacd99f66715aa3c50bcae';
COUNT=$((COUNT+1))

# 150/549: Imperial HVAC Services
echo "  [150/549] Would quarantine: Imperial HVAC Services (e89a2106be96006d...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='e89a2106be96006d5e8f0e7c1253dbbf4d58f7e8643e18b34ca59c9eb32393fb';
COUNT=$((COUNT+1))

# 151/549: Houston Premier Roofing
echo "  [151/549] Would quarantine: Houston Premier Roofing (50f1febe0c6d8a6e...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='50f1febe0c6d8a6e6fa4805fde75463e173aebd674208c36da0d35ece5508c85';
COUNT=$((COUNT+1))

# 152/549: Knight'\''s Mechanical
echo "  [152/549] Would quarantine: Knight'\''s Mechanical (c45302c33fb3aff6...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='c45302c33fb3aff61bd6ecc824015862d70db8e83e3daf36e85d33d0a50199ad';
COUNT=$((COUNT+1))

# 153/549: Mister Sparky of Houston
echo "  [153/549] Would quarantine: Mister Sparky of Houston (edefcdec95d61100...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='edefcdec95d61100b27bd15863360466600802b439edcc1ec5adb5876ff2ea66';
COUNT=$((COUNT+1))

# 154/549: Blue Collar Services
echo "  [154/549] Would quarantine: Blue Collar Services (523c31e2401228aa...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='523c31e2401228aa41ab7a0ee8e4d0679c50a3ef1d037382c2360f5f8fb04cf1';
COUNT=$((COUNT+1))

# 155/549: ACT Electric
echo "  [155/549] Would quarantine: ACT Electric (9f871f777ef0b8a5...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='9f871f777ef0b8a5641c8680faf1201cd59f639e537bfdfe7919d15c15ce2596';
COUNT=$((COUNT+1))

# 156/549: Miller and Sons Electric
echo "  [156/549] Would quarantine: Miller and Sons Electric (e411f41f001f0be8...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='e411f41f001f0be8216f7f31598afbd65c4134b46aa2b0b2a3dd145d0bc61202';
COUNT=$((COUNT+1))

# 157/549: The Wire Guy Electric
echo "  [157/549] Would quarantine: The Wire Guy Electric (42b2c711c4c38c4c...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='42b2c711c4c38c4c12b52af210e00a062bfaec4cafbbd41734e83c2626abfb2e';
COUNT=$((COUNT+1))

# 158/549: Redemption Roofing AZ
echo "  [158/549] Would quarantine: Redemption Roofing AZ (aa2a3354026d3c9b...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='aa2a3354026d3c9bc01d168fb9deb95620e02f3465ed64a7ed47778ceac05950';
COUNT=$((COUNT+1))

# 159/549: The Roofing Company
echo "  [159/549] Would quarantine: The Roofing Company (c17d60ce38d943a4...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='c17d60ce38d943a45d56caa35ceebbadef8cc0085963adeb2b53b2e26c76f306';
COUNT=$((COUNT+1))

# 160/549: Right Way Roofing, Inc.
echo "  [160/549] Would quarantine: Right Way Roofing, Inc. (af43b884abcf8a2e...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='af43b884abcf8a2e391b89ab462e0575799ba31dafd479b0541efb6fff649fcb';
COUNT=$((COUNT+1))

# 161/549: Superstition Plumbing
echo "  [161/549] Would quarantine: Superstition Plumbing (05eccc3620d229d5...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='05eccc3620d229d565a178057b7951cf8c5283f2bb6f5164bc8a18c9745c3231';
COUNT=$((COUNT+1))

# 162/549: OX Plumbing Services LLC
echo "  [162/549] Would quarantine: OX Plumbing Services LLC (269c0653fc79eff3...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='269c0653fc79eff3c91c37a172ba16cd7abff8d15c61316b4e90f4987cc31cc0';
COUNT=$((COUNT+1))

# 163/549: Total Plumbing & Drain
echo "  [163/549] Would quarantine: Total Plumbing & Drain (a6263a9cf93f5e6f...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='a6263a9cf93f5e6f7f6815332b2da68560d8c350c2f835ca215c814679f97a74';
COUNT=$((COUNT+1))

# 164/549: The Plumber
echo "  [164/549] Would quarantine: The Plumber (06407ecf1fb39074...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='06407ecf1fb39074df5b58270c59b4f634580ad41cc2266fd00a1567958f056f';
COUNT=$((COUNT+1))

# 165/549: The Cooling & Plumbing Co
echo "  [165/549] Would quarantine: The Cooling & Plumbing Co (5c0b89df107d202b...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='5c0b89df107d202b3cdf3b9213b7af104766af281c42ea0a9493660964b5b11b';
COUNT=$((COUNT+1))

# 166/549: PlumbSmart Plumbing Heating and Air
echo "  [166/549] Would quarantine: PlumbSmart Plumbing Heating and Air (cad62f1f58743124...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='cad62f1f58743124c949d6e520762f0c7ff4b674f65423410b250ad59c72b86b';
COUNT=$((COUNT+1))

# 167/549: Sagan Electric
echo "  [167/549] Would quarantine: Sagan Electric (420fab5f4ec0e24a...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='420fab5f4ec0e24a0e78b53c1438cc23ddb615b94cb8bcef285df5933dff4ed3';
COUNT=$((COUNT+1))

# 168/549: OldTown Electric Inc.
echo "  [168/549] Would quarantine: OldTown Electric Inc. (9888de269fd89b77...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='9888de269fd89b77dc4531cb2dc9b25d310487eb2615507e5ce8862009bd06d4';
COUNT=$((COUNT+1))

# 169/549: Myro Electrical
echo "  [169/549] Would quarantine: Myro Electrical (e666d7ca0e82914f...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='e666d7ca0e82914f950357278e7475f1a9594b3cded0fa1ea4761387394baed5';
COUNT=$((COUNT+1))

# 170/549: Four Ace Electrical Services Corporation
echo "  [170/549] Would quarantine: Four Ace Electrical Services Corporation (7842e5a4b1a64298...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='7842e5a4b1a64298de240b58a2924693864ed9e90c3c21dddc9c096c3cd476f5';
COUNT=$((COUNT+1))

# 171/549: Peach Electric Inc
echo "  [171/549] Would quarantine: Peach Electric Inc (3fa91ab9f071afe4...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='3fa91ab9f071afe404dd591859080eb28f500461178be6d7dfcb2c013c2097c1';
COUNT=$((COUNT+1))

# 172/549: Maverick Electric, Heating and Air
echo "  [172/549] Would quarantine: Maverick Electric, Heating and Air (45fced0ce0d4be02...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='45fced0ce0d4be02274603a83988e0e0caef86365e2affe93a90169a6c5fadf7';
COUNT=$((COUNT+1))

# 173/549: Match Point Roofing Inc
echo "  [173/549] Would quarantine: Match Point Roofing Inc (0ffe48500db9f58a...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='0ffe48500db9f58a302c7adddf1dfb8a085ea7a03e09a1a824f93c3fd8eccb7a';
COUNT=$((COUNT+1))

# 174/549: Roof Doctors Sacramento County
echo "  [174/549] Would quarantine: Roof Doctors Sacramento County (d5a249891d173eab...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='d5a249891d173eaba7c170e127d47f7107d48e6f197d443090cd5d18b6711adf';
COUNT=$((COUNT+1))

# 175/549: Cisco'\''s Roofing
echo "  [175/549] Would quarantine: Cisco'\''s Roofing (8a5c5ca9701eb8be...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='8a5c5ca9701eb8be8dbb309bfabd257df10aa4e868889f4c55cb4b05626f3cb3';
COUNT=$((COUNT+1))

# 176/549: Los Reyes Roofing Inc
echo "  [176/549] Would quarantine: Los Reyes Roofing Inc (4bc835e0ce8ebd29...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='4bc835e0ce8ebd29a0cc22e7bbdd1c43df1bc0e7b83c46ab7d616088581987bd';
COUNT=$((COUNT+1))

# 177/549: Sacramento Roofing Service & Contractors
echo "  [177/549] Would quarantine: Sacramento Roofing Service & Contractors (c9b5b250e17d5f6e...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='c9b5b250e17d5f6e16ba8ef7ea0e897a8e47e37457c7029ad01b1e71b46dde37';
COUNT=$((COUNT+1))

# 178/549: Elite Roofing Sacramento
echo "  [178/549] Would quarantine: Elite Roofing Sacramento (0db18881d0dc6e58...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='0db18881d0dc6e5857e57f085eda06cfdfcc98fea19a5f5ab5dfcd9176f75dd4';
COUNT=$((COUNT+1))

# 179/549: NorCal Roofing & Construction
echo "  [179/549] Would quarantine: NorCal Roofing & Construction (84e8ce3806787aea...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='84e8ce3806787aea982a75ed3a665037d7490d7349f977c2aaeb7d7dfabab964';
COUNT=$((COUNT+1))

# 180/549: Sacramento Roofing Inc
echo "  [180/549] Would quarantine: Sacramento Roofing Inc (f3399fcc8fa2af04...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='f3399fcc8fa2af04f4b450481691a4a5f7023fc945662de8bfb073b6a51f4b0e';
COUNT=$((COUNT+1))

# 181/549: Titan Roofing Solutions
echo "  [181/549] Would quarantine: Titan Roofing Solutions (75a2f2efadbd5276...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='75a2f2efadbd5276bfbb82a67ea995c72a6cee31eb7ccfb67c990cecfb3bb6f8';
COUNT=$((COUNT+1))

# 182/549: Ace Plumbing, Heating & Air Conditioning
echo "  [182/549] Would quarantine: Ace Plumbing, Heating & Air Conditioning (d3023a7d943ea243...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='d3023a7d943ea2431b47e247846c234da66ce47759796f3f7db9d68f32a2914a';
COUNT=$((COUNT+1))

# 183/549: 5 Star Plumbing
echo "  [183/549] Would quarantine: 5 Star Plumbing (16960e1ba7faf91c...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='16960e1ba7faf91ca751ff977336ba1ae6e38a905f0c691f85c848f861150830';
COUNT=$((COUNT+1))

# 184/549: The Trenchless Co.
echo "  [184/549] Would quarantine: The Trenchless Co. (10ca92aa35f43b2a...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='10ca92aa35f43b2a946447b2d6c130149ed27081202e0600a7fa00bb31ddde6e';
COUNT=$((COUNT+1))

# 185/549: Rooter Hero Plumbing & Air of Sacramento
echo "  [185/549] Would quarantine: Rooter Hero Plumbing & Air of Sacramento (6f8c811871628778...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='6f8c81187162877829e5390a823574b869c16c54cd4d13ebce5aa378dc3e39b0';
COUNT=$((COUNT+1))

# 186/549: Platero Parada Plumbing
echo "  [186/549] Would quarantine: Platero Parada Plumbing (bd0561539f146dbf...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='bd0561539f146dbf6b8068644e52afcf0a17c1a711e437a3daebbd53ec16d4d5';
COUNT=$((COUNT+1))

# 187/549: Millennium Plumbing Specialist, Inc
echo "  [187/549] Would quarantine: Millennium Plumbing Specialist, Inc (9bf9581b01ce41ee...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='9bf9581b01ce41eeeac64e7acf4c5f9750101c52e7e6a38e1c2a72671aadb29f';
COUNT=$((COUNT+1))

# 188/549: Armstrong Plumbing Inc
echo "  [188/549] Would quarantine: Armstrong Plumbing Inc (ed73b5b28ebcb057...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='ed73b5b28ebcb057d1dd5fac21b3ece37f2e58b5cdac6f71a467c770ee09770a';
COUNT=$((COUNT+1))

# 189/549: A Cool Air, Inc.
echo "  [189/549] Would quarantine: A Cool Air, Inc. (6c82d6ef6723e728...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='6c82d6ef6723e7284105d705037b2a1283c810c1de02ec19d06df38af1f110a4';
COUNT=$((COUNT+1))

# 190/549: Jaguar Heating & Air
echo "  [190/549] Would quarantine: Jaguar Heating & Air (0893f1e689119b2e...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='0893f1e689119b2e0d9bf08647da230f05c2d3501c09fad2db033c24d7c199ed';
COUNT=$((COUNT+1))

# 191/549: The Roofing Crew LLC
echo "  [191/549] Would quarantine: The Roofing Crew LLC (0b710eee00d54d12...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='0b710eee00d54d1243a0de89ab16b51946052ebe5699b04adc91d40e6c168b62';
COUNT=$((COUNT+1))

# 192/549: Roof Maxx of N. Fresno, CA
echo "  [192/549] Would quarantine: Roof Maxx of N. Fresno, CA (f68a7a71aabea484...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='f68a7a71aabea484307a0615f0e2599f93f4f24d142f6fae12179b9dcb464535';
COUNT=$((COUNT+1))

# 193/549: Roofs 4 Less
echo "  [193/549] Would quarantine: Roofs 4 Less (bf54e69e4047ce92...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='bf54e69e4047ce920b80c9b35ac25fea0710b41bfc3458372db0f8778038c173';
COUNT=$((COUNT+1))

# 194/549: Zinc Roofing & Air Conditioning
echo "  [194/549] Would quarantine: Zinc Roofing & Air Conditioning (1a98798a52ab4072...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='1a98798a52ab407269e357cd005502e5d440130f3cad841c3e97b4e8ab533670';
COUNT=$((COUNT+1))

# 195/549: High Impact Roofing Inc
echo "  [195/549] Would quarantine: High Impact Roofing Inc (8c4628dd9ec61a48...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='8c4628dd9ec61a4846ac5f21df3651d321bac5a932914321f46d48f54cd09e23';
COUNT=$((COUNT+1))

# 196/549: Best Choice Roofing
echo "  [196/549] Would quarantine: Best Choice Roofing (28e1d6839ef64d11...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='28e1d6839ef64d11bc2ccc1fa47d14c30fe09196f9cce746235a8e9cc6d293c2';
COUNT=$((COUNT+1))

# 197/549: New View Roofing
echo "  [197/549] Would quarantine: New View Roofing (3abce076c595f343...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='3abce076c595f3431130303fe0fffd77cb50cca222f23c8bb236c11e0f6c18e2';
COUNT=$((COUNT+1))

# 198/549: Fresno Plumbing & Heating Inc
echo "  [198/549] Would quarantine: Fresno Plumbing & Heating Inc (7bd0a01f79901a99...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='7bd0a01f79901a9917f4c399c7d62ac5b83dbde2825ad91c72443ce85e4727d7';
COUNT=$((COUNT+1))

# 199/549: PDS Plumbing and Air
echo "  [199/549] Would quarantine: PDS Plumbing and Air (cbab7f3b47894b39...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='cbab7f3b47894b395b42c315c2a2b4d92c7033d34d76412b3ee91238bd992c87';
COUNT=$((COUNT+1))

# 200/549: 911 Plumbing & Electric INC
echo "  [200/549] Would quarantine: 911 Plumbing & Electric INC (526a4404384b238a...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='526a4404384b238aeabfbf93b2918a3e8f829a1229b7e117666d832e3d8975eb';
COUNT=$((COUNT+1))

# 201/549: Rod'\''s Plumbing Service
echo "  [201/549] Would quarantine: Rod'\''s Plumbing Service (9318015445b04361...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='9318015445b04361662de86f2c8e626eadb9116f408a6a00166be6f6310a4c6f';
COUNT=$((COUNT+1))

# 202/549: All Star Plumbing Fresno
echo "  [202/549] Would quarantine: All Star Plumbing Fresno (a1867448d14329f7...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='a1867448d14329f72ab62d315b5b05d25d692c6ac6762f11efd5d102654df4b3';
COUNT=$((COUNT+1))

# 203/549: Low Cost Plumbing Services
echo "  [203/549] Would quarantine: Low Cost Plumbing Services (1d04716f4b7e0e42...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='1d04716f4b7e0e4240f2b2669ba533273a96b0a8f2e2277995cf747a512d0c74';
COUNT=$((COUNT+1))

# 204/549: Golden Comfort AC & Heating Repair
echo "  [204/549] Would quarantine: Golden Comfort AC & Heating Repair (0fd46afb5776415e...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='0fd46afb5776415e6b172780ab43823daa2ad8cc135ffe405a7cfa0cfce9f7fc';
COUNT=$((COUNT+1))

# 205/549: Allbritten Heating, Air Conditioning, Plumbing, and Electrical
echo "  [205/549] Would quarantine: Allbritten Heating, Air Conditioning, Plumbing, and Electrical (8ef68ebaaf19735b...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='8ef68ebaaf19735b07648e91aaccab12778ec8b9b0924952a3a5b7ac3ea844a1';
COUNT=$((COUNT+1))

# 206/549: Valley Air Conditioning & Repair, Inc.
echo "  [206/549] Would quarantine: Valley Air Conditioning & Repair, Inc. (c06e9878f8966a6c...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='c06e9878f8966a6cfcfaf87fcaf4567b0e2886519e621cc979b3eee03782b30c';
COUNT=$((COUNT+1))

# 207/549: Fresno Heating and Cooling
echo "  [207/549] Would quarantine: Fresno Heating and Cooling (beb99bdc5535b972...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='beb99bdc5535b97289ae64642121ebc8c5e17f27bb6b908cc84587a6e3bab014';
COUNT=$((COUNT+1))

# 208/549: Balanced Comfort
echo "  [208/549] Would quarantine: Balanced Comfort (5f3b9c1141e1126b...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='5f3b9c1141e1126ba6154bc0f38746557f2844b5a9d1a76e8b3faf935f1d7587';
COUNT=$((COUNT+1))

# 209/549: DSR Roofing
echo "  [209/549] Would quarantine: DSR Roofing (7d54359d51aa30f5...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='7d54359d51aa30f5972c94f841e68a6c3d1812b991d8444ac443467f14ef83ef';
COUNT=$((COUNT+1))

# 210/549: Sunset Roofing, LLC
echo "  [210/549] Would quarantine: Sunset Roofing, LLC (3495cafaed4e5124...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='3495cafaed4e51247f3c3ec4649aa52ec168d64459ea1bb03812d55771b438d3';
COUNT=$((COUNT+1))

# 211/549: Modern Roofing
echo "  [211/549] Would quarantine: Modern Roofing (369864345b8c2797...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='369864345b8c2797dbe13ae84ad3f744487599e649815ebf854a4c1ab679e10a';
COUNT=$((COUNT+1))

# 212/549: B&M Roofing
echo "  [212/549] Would quarantine: B&M Roofing (526f409f11233435...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='526f409f112334358c6df13aae500efa5d52029eacdbdd5fe6933640978ecaf7';
COUNT=$((COUNT+1))

# 213/549: Canyon Roofing, LLC
echo "  [213/549] Would quarantine: Canyon Roofing, LLC (44c63056ca95536f...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='44c63056ca95536f12e5d87ab903cbb96ef80a0375b2bbc6aedd5c760781b88b';
COUNT=$((COUNT+1))

# 214/549: Jobe & Sons Plumbing
echo "  [214/549] Would quarantine: Jobe & Sons Plumbing (c6bc8a7f82174887...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='c6bc8a7f82174887ca414f524180c4c4a1eb9fc0c8c2d2f4f95e17b4e053e66c';
COUNT=$((COUNT+1))

# 215/549: Code Blue Plumbing
echo "  [215/549] Would quarantine: Code Blue Plumbing (7cd2986d3742b31f...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='7cd2986d3742b31f0b9fa4c43ad3d401394c0f4c7a2838c4acec926f6a05cd92';
COUNT=$((COUNT+1))

# 216/549: Ram Plumbing, Inc.
echo "  [216/549] Would quarantine: Ram Plumbing, Inc. (8ea0931b3fbb8c4c...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='8ea0931b3fbb8c4c344fa2ae6d92fe184312fb691ecdb18f838f6bbb205ca3f4';
COUNT=$((COUNT+1))

# 217/549: Tucson Plumbing
echo "  [217/549] Would quarantine: Tucson Plumbing (52d9900f11ad4a7e...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='52d9900f11ad4a7ed69b971c59e5e9da6532a813406c1b6764336f768444b966';
COUNT=$((COUNT+1))

# 218/549: Imperial Plumbing
echo "  [218/549] Would quarantine: Imperial Plumbing (477ccaf7a8fa62c3...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='477ccaf7a8fa62c3e8d137e44980294a6e9a9a96916585d6deb1340bedbf617b';
COUNT=$((COUNT+1))

# 219/549: Al Coronado Plumbing
echo "  [219/549] Would quarantine: Al Coronado Plumbing (8dd50a1b0f83fbfb...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='8dd50a1b0f83fbfb17c1f1024a2884122cbdf128368f29d7428dc5741839f010';
COUNT=$((COUNT+1))

# 220/549: GoodFellas Air Conditioning & Plumbing
echo "  [220/549] Would quarantine: GoodFellas Air Conditioning & Plumbing (3c720bb31e6493fe...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='3c720bb31e6493fe7a93c5395bb7fd52e369b92530d7da3e0c53836e0584b6ae';
COUNT=$((COUNT+1))

# 221/549: Alaskan Air Conditioning & Heating Tucson
echo "  [221/549] Would quarantine: Alaskan Air Conditioning & Heating Tucson (26e82ebec08bb853...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='26e82ebec08bb853231e3272cc43a5923e5a16d8afc445ede7ba7f600c1ea394';
COUNT=$((COUNT+1))

# 222/549: Intelligent Design Air Conditioning, Plumbing, Solar, & Electric
echo "  [222/549] Would quarantine: Intelligent Design Air Conditioning, Plumbing, Solar, & Electric (190a90cc2d637a99...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='190a90cc2d637a99ccf356e02b9375c269b24612a19f69ee0d2082943920a526';
COUNT=$((COUNT+1))

# 223/549: HVAC Heating & Cooling LLC
echo "  [223/549] Would quarantine: HVAC Heating & Cooling LLC (d9c573b74659797b...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='d9c573b74659797bb765463a93c2fab6a451d20a205f5a8c09507cb61d18a5c0';
COUNT=$((COUNT+1))

# 224/549: True Light Electric
echo "  [224/549] Would quarantine: True Light Electric (f023dc27c554f72c...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='f023dc27c554f72c7b29ed1e932198047ff1755670d291a4a0936280036ec61c';
COUNT=$((COUNT+1))

# 225/549: Dove Electric
echo "  [225/549] Would quarantine: Dove Electric (ea94838f6f33a023...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='ea94838f6f33a023c5f713d1dacf3716fb02b6568b07a8ceb1cdde1f9db16540';
COUNT=$((COUNT+1))

# 226/549: Energized Electric LLC
echo "  [226/549] Would quarantine: Energized Electric LLC (1247801c96cf4d20...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='1247801c96cf4d20dd57e9d1eae5c1f793dfcbb98c1e5ae7cb86ace31aac46f2';
COUNT=$((COUNT+1))

# 227/549: McDonald Electric
echo "  [227/549] Would quarantine: McDonald Electric (83810e04febc8cf3...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='83810e04febc8cf3a3f417ebaec3d3bf077c41b177905772079fb30a5aa5841e';
COUNT=$((COUNT+1))

# 228/549: RMC Roofing & Construction
echo "  [228/549] Would quarantine: RMC Roofing & Construction (2b7e0f0b475fecb2...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='2b7e0f0b475fecb239895c7c0b254eede27495888170bfbaadb52d5700859fac';
COUNT=$((COUNT+1))

# 229/549: Paramount Roofing
echo "  [229/549] Would quarantine: Paramount Roofing (0279e0618ca40f7a...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='0279e0618ca40f7aff1ac891f130883d8c6a5cbb6988cedd1ccf887d8d8812d8';
COUNT=$((COUNT+1))

# 230/549: Altitude Roofing
echo "  [230/549] Would quarantine: Altitude Roofing (e6e4620f920003ef...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='e6e4620f920003efa86987ed1d915b45196416fa3b90eec42291fb13d92e9f6a';
COUNT=$((COUNT+1))

# 231/549: All Seasons Roofing Albuquerque
echo "  [231/549] Would quarantine: All Seasons Roofing Albuquerque (66f5175d606c10e5...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='66f5175d606c10e508493b161bdf88dfa889339284d24295b1739db1f744fd8b';
COUNT=$((COUNT+1))

# 232/549: National Roofing
echo "  [232/549] Would quarantine: National Roofing (ffbc72f56989b742...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='ffbc72f56989b742aaa8c79785e01ca632cea65d39196753f9e82339966c6948';
COUNT=$((COUNT+1))

# 233/549: Homerun Plumbing Heating and Cooling
echo "  [233/549] Would quarantine: Homerun Plumbing Heating and Cooling (56d8d6890012044a...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='56d8d6890012044a8bb044121a632f02e6da51b67a76bcf3ef127c869a507b64';
COUNT=$((COUNT+1))

# 234/549: Number One Plumbing, A/C, Solar & Electric
echo "  [234/549] Would quarantine: Number One Plumbing, A/C, Solar & Electric (537563cca62e80ae...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='537563cca62e80ae1173388f0775430879c0ee71e673ca42592ed9cc359f948e';
COUNT=$((COUNT+1))

# 235/549: Pen Pals Cooling Heating Plumbing
echo "  [235/549] Would quarantine: Pen Pals Cooling Heating Plumbing (a3d4dbafeb0381f2...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='a3d4dbafeb0381f26cb28eeb04dfdf200ba1ff0f20013efd00896c31f30bce7f';
COUNT=$((COUNT+1))

# 236/549: NCB Mechanical
echo "  [236/549] Would quarantine: NCB Mechanical (dba4348f8daa7a23...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='dba4348f8daa7a23501657913a616ef8f535961cbfa4a1c70ec73946262a94d6';
COUNT=$((COUNT+1))

# 237/549: Thompson Heating & Air Conditioning
echo "  [237/549] Would quarantine: Thompson Heating & Air Conditioning (011c922933a9b88e...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='011c922933a9b88e5a46b10afc5f9a59811b2a95b9dc2304953f04953e662dda';
COUNT=$((COUNT+1))

# 238/549: B. Carlson Heating, Cooling & Plumbing, Inc.
echo "  [238/549] Would quarantine: B. Carlson Heating, Cooling & Plumbing, Inc. (2e0a19542a8f727c...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='2e0a19542a8f727cae0e8b0e94d2073c38ad3405f121a9014b5ca29e3ab53fc5';
COUNT=$((COUNT+1))

# 239/549: Anderson Air Corps Heating & Cooling
echo "  [239/549] Would quarantine: Anderson Air Corps Heating & Cooling (6952c8eccfdf85cb...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='6952c8eccfdf85cb6bfbf7ad524f4461edb30ecf5aa46582468651ca66ddc0e9';
COUNT=$((COUNT+1))

# 240/549: Air Care New Mexico
echo "  [240/549] Would quarantine: Air Care New Mexico (947994da26ed35b0...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='947994da26ed35b0440d053b4673811828f5afa4ab5e1decb5f80b8d38398e43';
COUNT=$((COUNT+1))

# 241/549: Best Electric Service, Inc.
echo "  [241/549] Would quarantine: Best Electric Service, Inc. (5260d655c27bc683...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='5260d655c27bc68330397ae183a6b48a2825b92ba70938653b01e53d9934671d';
COUNT=$((COUNT+1))

# 242/549: Advance Electrical Contractors
echo "  [242/549] Would quarantine: Advance Electrical Contractors (09ff398116c5a6aa...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='09ff398116c5a6aa3cb24308145d84ca3302ae8e67683138fc43808f13691881';
COUNT=$((COUNT+1))

# 243/549: Lehmann Electrical & Design
echo "  [243/549] Would quarantine: Lehmann Electrical & Design (87cc76538f950b58...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='87cc76538f950b58441377020170022748d62c7c326fa63021571423d5de8177';
COUNT=$((COUNT+1))

# 244/549: Prime Electric LLC
echo "  [244/549] Would quarantine: Prime Electric LLC (7197569aef282142...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='7197569aef282142f396d9431bc4cb5d676fcc2c2e4e700691f51fc8cba30f7a';
COUNT=$((COUNT+1))

# 245/549: Alteri Electric
echo "  [245/549] Would quarantine: Alteri Electric (d24be770728e174c...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='d24be770728e174c148b868e6be91867127b1e005caf9a7aaa9c34a55adf680e';
COUNT=$((COUNT+1))

# 246/549: Current Electric
echo "  [246/549] Would quarantine: Current Electric (bf3d3d9445df8e06...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='bf3d3d9445df8e068f1fe77ab65f2da0f1b1fec015d90c009c84f2418f0a5745';
COUNT=$((COUNT+1))

# 247/549: Ridge Top Exteriors
echo "  [247/549] Would quarantine: Ridge Top Exteriors (e9a6e9b0e482a6f2...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='e9a6e9b0e482a6f2b305b5f9d590dd15f782881e66e21f764401cab6b83ac134';
COUNT=$((COUNT+1))

# 248/549: Community Roofing & Restoration
echo "  [248/549] Would quarantine: Community Roofing & Restoration (55db3a020020e678...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='55db3a020020e678b0854579f22c26c897fb7fcb2d7e47723c7be38a8f7b703a';
COUNT=$((COUNT+1))

# 249/549: Milwaukee Roofing
echo "  [249/549] Would quarantine: Milwaukee Roofing (12771b14efa5fccb...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='12771b14efa5fccb0ef5b2addb44b5fac518ae0cae408f8516396f9d75effaf1';
COUNT=$((COUNT+1))

# 250/549: ABC Sewer & Drain Cleaning
echo "  [250/549] Would quarantine: ABC Sewer & Drain Cleaning (012bc4c729a1158e...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='012bc4c729a1158e6169149435dd3961ff4238f8db71adf5f88e034c4af508ea';
COUNT=$((COUNT+1))

# 251/549: Milw Drain Cleaning
echo "  [251/549] Would quarantine: Milw Drain Cleaning (6499ba30d024df40...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='6499ba30d024df40167e309a7c56b53c3c6e2f9341755d1055e0c59f474300fa';
COUNT=$((COUNT+1))

# 252/549: Affordable Heating and Air Conditioning, Inc.
echo "  [252/549] Would quarantine: Affordable Heating and Air Conditioning, Inc. (610edc597a85f1ec...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='610edc597a85f1ec996da15e149a674a65fbe1d3e652d0bec991e03a41ee6b43';
COUNT=$((COUNT+1))

# 253/549: Third Coast HVAC, AC & Furnace Repair
echo "  [253/549] Would quarantine: Third Coast HVAC, AC & Furnace Repair (f2a9ee0c92a943d5...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='f2a9ee0c92a943d56e3ce2dc3e37c03a5e39db9a97e6dd7a05dbaab33b923878';
COUNT=$((COUNT+1))

# 254/549: A-1 Milwaukee Heating and Cooling
echo "  [254/549] Would quarantine: A-1 Milwaukee Heating and Cooling (18cf9201ef646e0e...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='18cf9201ef646e0ee0c7dc98d1595b2390f253b84cf8c02132f8fafced66c773';
COUNT=$((COUNT+1))

# 255/549: Burkhardt Heating, Cooling, Plumbing & Electric
echo "  [255/549] Would quarantine: Burkhardt Heating, Cooling, Plumbing & Electric (c0b0113cf381b7e0...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='c0b0113cf381b7e0cd2ed7ccd14f2c1d21bbccc145c43cddb33bc6369a5f24d3';
COUNT=$((COUNT+1))

# 256/549: Baltimore Roofing & Remodeling
echo "  [256/549] Would quarantine: Baltimore Roofing & Remodeling (f51722317e166b38...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='f51722317e166b380327abcf90ba0a7ce1f0b9cdc22e99c91ce752807f29e412';
COUNT=$((COUNT+1))

# 257/549: Ruff Roofers
echo "  [257/549] Would quarantine: Ruff Roofers (f9fbc627bca306b8...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='f9fbc627bca306b8b65e705eed028d7eeb903d132ff3df85c0e8ccb6fd9e5876';
COUNT=$((COUNT+1))

# 258/549: City Builders
echo "  [258/549] Would quarantine: City Builders (f9f262ea1b69dd75...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='f9f262ea1b69dd750147c5f62c829b094e3ca5d7f797b86c2520d360670de45c';
COUNT=$((COUNT+1))

# 259/549: Park Heights Roofing
echo "  [259/549] Would quarantine: Park Heights Roofing (eb25b7887452eef5...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='eb25b7887452eef57d520b0e881397ad8dea2aa661e4688df73bb0039132cc8c';
COUNT=$((COUNT+1))

# 260/549: Mr. Rooter Plumbing of Greater Baltimore
echo "  [260/549] Would quarantine: Mr. Rooter Plumbing of Greater Baltimore (c4d9a1fff2971b71...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='c4d9a1fff2971b710eeb11ed6eba87d1f129ffe4a0c4c7d9be247f280c2db98a';
COUNT=$((COUNT+1))

# 261/549: A.J. Michaels
echo "  [261/549] Would quarantine: A.J. Michaels (ba0a742c1a99941a...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='ba0a742c1a99941adc66c2a3cd18f1751984a2e5a4d578a8a43afe51761a3584';
COUNT=$((COUNT+1))

# 262/549: Amazing Plumbing, Heating & Air
echo "  [262/549] Would quarantine: Amazing Plumbing, Heating & Air (b4c301ba08db7e4e...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='b4c301ba08db7e4e77bc04d91924d68d3037ea02e433aac891a3ca408f53df65';
COUNT=$((COUNT+1))

# 263/549: Maryland
echo "  [263/549] Would quarantine: Maryland (18a3b34ce4776fe7...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='18a3b34ce4776fe7792004c306c8270f6ec5e0a5acbb35f68ad1db2c5d0fe9b6';
COUNT=$((COUNT+1))

# 264/549: St. Matthews Electric
echo "  [264/549] Would quarantine: St. Matthews Electric (0d28219a4c251df5...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='0d28219a4c251df5429e5cb3e4079952dec7a8fade8a60732753a872351bb4db';
COUNT=$((COUNT+1))

# 265/549: Durbin Electric LLC
echo "  [265/549] Would quarantine: Durbin Electric LLC (9703faddf80e8bba...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='9703faddf80e8bba3d9a671f5f5aa85a63ea5e2cbd9535b11b8dfbf5a481b54d';
COUNT=$((COUNT+1))

# 266/549: Laswell Electric & Security
echo "  [266/549] Would quarantine: Laswell Electric & Security (66d5c03937934062...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='66d5c03937934062eeeed3d034a1125b3e6f5cce9932fd9929e461ea554b4e9b';
COUNT=$((COUNT+1))

# 267/549: Origin Roofing & Exteriors
echo "  [267/549] Would quarantine: Origin Roofing & Exteriors (1f1ac7e540169a75...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='1f1ac7e540169a758adce8db58c7b0dc5e42bb165bd366b4918eca6d058e0f95';
COUNT=$((COUNT+1))

# 268/549: Roof It Right
echo "  [268/549] Would quarantine: Roof It Right (fa951f86c0a79d83...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='fa951f86c0a79d834337dc3a5a16ce966ebd595b060f3c66871dbf91cac982d2';
COUNT=$((COUNT+1))

# 269/549: Mr. Roof Louisville
echo "  [269/549] Would quarantine: Mr. Roof Louisville (9dce5d09235814e6...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='9dce5d09235814e69def8438b3469c1d3b3fa621bb2f15fec3fba2105d92b3fa';
COUNT=$((COUNT+1))

# 270/549: Pure Roofing Company
echo "  [270/549] Would quarantine: Pure Roofing Company (936ff675e820bb36...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='936ff675e820bb36efa803895a725518ff71c46cdc1eff81a100b71026199321';
COUNT=$((COUNT+1))

# 271/549: Christian Brothers Roofing
echo "  [271/549] Would quarantine: Christian Brothers Roofing (2d7f0189c9d763a1...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='2d7f0189c9d763a17100c03419617948b09ba43d799a5566e9c2660dac68432d';
COUNT=$((COUNT+1))

# 272/549: Big League Roofers
echo "  [272/549] Would quarantine: Big League Roofers (6f255a175fcba294...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='6f255a175fcba2941da4e36f69ceae70126a4df3dd8b419fb89f67f0976ad115';
COUNT=$((COUNT+1))

# 273/549: Daniel Brown Plumbing
echo "  [273/549] Would quarantine: Daniel Brown Plumbing (1131d0d31fa1d2f9...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='1131d0d31fa1d2f91e15d66d73185b0a0177a40852dd88b472cfbd12b84ea032';
COUNT=$((COUNT+1))

# 274/549: 1-Tom-Plumber
echo "  [274/549] Would quarantine: 1-Tom-Plumber (3cb2714b13fb0e0f...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='3cb2714b13fb0e0f7c19110caf91c2a5e66040a90d6c77ce0c5daf55cb180f7e';
COUNT=$((COUNT+1))

# 275/549: UR Best HVAC
echo "  [275/549] Would quarantine: UR Best HVAC (216d966eabd490a8...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='216d966eabd490a830b812d6a6dbae3062d16136b1ddd3b7a37beef74fbc94c3';
COUNT=$((COUNT+1))

# 276/549: Tom Drexler Plumbing, Air & Electric
echo "  [276/549] Would quarantine: Tom Drexler Plumbing, Air & Electric (12eb5ee8a3063bf7...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='12eb5ee8a3063bf7b9e9f05e2af8e67fdaf09b324dfcd0d2606b41d325f19512';
COUNT=$((COUNT+1))

# 277/549: Chapman Heating and Cooling
echo "  [277/549] Would quarantine: Chapman Heating and Cooling (1701ade28dd00029...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='1701ade28dd00029e94d19dffc58ad51c671f2198269ea6de76fbade9ca48263';
COUNT=$((COUNT+1))

# 278/549: One Choice Mechanical
echo "  [278/549] Would quarantine: One Choice Mechanical (68e8af5da350ba5e...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='68e8af5da350ba5e3af31f14f72493b35a809fde092f4c6e42b7784d527527a8';
COUNT=$((COUNT+1))

# 279/549: Aire Serv of Louisville
echo "  [279/549] Would quarantine: Aire Serv of Louisville (64f62d8f338e7715...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='64f62d8f338e77159224d20f06d47aaaad3214ea08ce4b61061daf762866d45e';
COUNT=$((COUNT+1))

# 280/549: Ross Electric Company
echo "  [280/549] Would quarantine: Ross Electric Company (3693d3cbc2b66f0f...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='3693d3cbc2b66f0f4d069bbaab3d5a777c107885c277860902b9c38a99542408';
COUNT=$((COUNT+1))

# 281/549: Excalibur Electrician of Memphis TN
echo "  [281/549] Would quarantine: Excalibur Electrician of Memphis TN (0cf81d7f29ef74e5...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='0cf81d7f29ef74e5c892d8c4dedf2a840e66ee514b27ea6bf62757907c13257a';
COUNT=$((COUNT+1))

# 282/549: Schwartz Electric Co. Inc.
echo "  [282/549] Would quarantine: Schwartz Electric Co. Inc. (ed5aa9361743c3e2...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='ed5aa9361743c3e2984a3558923e024c6cc95a1d2949285f93c8fb04ca92408d';
COUNT=$((COUNT+1))

# 283/549: Roof Pro LLC
echo "  [283/549] Would quarantine: Roof Pro LLC (3c683af0d3a8f037...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='3c683af0d3a8f0371c357b19f12fb8864fb8f3e7772dc40f847fb85829b2a6c1';
COUNT=$((COUNT+1))

# 284/549: Restoration Roofing
echo "  [284/549] Would quarantine: Restoration Roofing (100e81df82f575cb...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='100e81df82f575cb9f1f2133ace5b7dfc638bab8902d2b090429d35f56388409';
COUNT=$((COUNT+1))

# 285/549: K&M Roofing & Exteriors
echo "  [285/549] Would quarantine: K&M Roofing & Exteriors (f434e82a61113381...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='f434e82a61113381c30ae86be087435cdcbf758991b23cfc175d5ed27eb925e1';
COUNT=$((COUNT+1))

# 286/549: Elite Roofing Solutions
echo "  [286/549] Would quarantine: Elite Roofing Solutions (caeb311ae09524c2...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='caeb311ae09524c28f1de5c2b7f6ef679c86a9c667ccbe5c78723edca4ec8988';
COUNT=$((COUNT+1))

# 287/549: Cool Roofs - Memphis
echo "  [287/549] Would quarantine: Cool Roofs - Memphis (39fc77791deb5a74...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='39fc77791deb5a7473aceb779df6a5017e8303d646df7d237b5f117aa294f4a8';
COUNT=$((COUNT+1))

# 288/549: National Economy Plumbers
echo "  [288/549] Would quarantine: National Economy Plumbers (4eac0b31aa0ddbb4...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='4eac0b31aa0ddbb495b2e78265ce5d2273d725293807be81bf07eeeb0dd82f15';
COUNT=$((COUNT+1))

# 289/549: Avantel Plumber of Memphis TN
echo "  [289/549] Would quarantine: Avantel Plumber of Memphis TN (aa806371cdb1226d...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='aa806371cdb1226da06d2b57e0af679f83460d56c03d98adc93105dc68905b5b';
COUNT=$((COUNT+1))

# 290/549: Traditional Plumbing Co Inc
echo "  [290/549] Would quarantine: Traditional Plumbing Co Inc (1f900b44e42a16a9...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='1f900b44e42a16a9abc32977f18ba85916177d1a925ffd03c89efd5136c300de';
COUNT=$((COUNT+1))

# 291/549: Premier Plumbing Pros
echo "  [291/549] Would quarantine: Premier Plumbing Pros (eb06a72d63d8cb0c...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='eb06a72d63d8cb0c9b848c01d34c35dd192fd5a2ee3b5ff881589fba7d7345e7';
COUNT=$((COUNT+1))

# 292/549: Smith'\''s Plumbing, Heating & Air
echo "  [292/549] Would quarantine: Smith'\''s Plumbing, Heating & Air (b051a441fb2f1221...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='b051a441fb2f12210890b4b78c30130009c3769e256f5bfb91382451b4e38782';
COUNT=$((COUNT+1))

# 293/549: Choate'\''s Air Conditioning, Heating, Plumbing And Electrical
echo "  [293/549] Would quarantine: Choate'\''s Air Conditioning, Heating, Plumbing And Electrical (244f2fcf3ea850cf...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='244f2fcf3ea850cf9b33c3bf51dc4350ca480d1150fdaeebab4ab2ea7a45f00a';
COUNT=$((COUNT+1))

# 294/549: OPACHS HVAC SERVICES
echo "  [294/549] Would quarantine: OPACHS HVAC SERVICES (2961eaba2636f26e...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='2961eaba2636f26ea4e8e96c5dea97a5c6862afb921e1680808a197d8eb9a38c';
COUNT=$((COUNT+1))

# 295/549: Aire Serv of Memphis
echo "  [295/549] Would quarantine: Aire Serv of Memphis (f39c331db4de92b1...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='f39c331db4de92b112e328faf5308eb73ccf5bcdd91e1970dbac5260c6cfd3f5';
COUNT=$((COUNT+1))

# 296/549: Choate'\''s Air Conditioning, Heating, Plumbing And Electrical - Memphis
echo "  [296/549] Would quarantine: Choate'\''s Air Conditioning, Heating, Plumbing And Electrical - Memphis (cf5db6160fbe0848...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='cf5db6160fbe08485e4e8cae88661e0d34fb2c9d462c66530fb5d6b7f017526a';
COUNT=$((COUNT+1))

# 297/549: Memphis Air Conditioning & Heating
echo "  [297/549] Would quarantine: Memphis Air Conditioning & Heating (adbb9523dd435b07...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='adbb9523dd435b07a75d15ee647f7f2b000a847ae9328eb2d40911f1df2b6214';
COUNT=$((COUNT+1))

# 298/549: National Electrical
echo "  [298/549] Would quarantine: National Electrical (6e5039c0ae2f26c1...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='6e5039c0ae2f26c1900a26050b4dd249d5f14b391b39570ed588282f1e6e11f3';
COUNT=$((COUNT+1))

# 299/549: Residential Electric
echo "  [299/549] Would quarantine: Residential Electric (698a2bee3024f995...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='698a2bee3024f99588ab0486205db36ede2c1bab4cdcc9a1ce9b774bee5a8f73';
COUNT=$((COUNT+1))

# 300/549: Jayone electric llc
echo "  [300/549] Would quarantine: Jayone electric llc (aaed9eb7cb20c987...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='aaed9eb7cb20c987a8603db0b3b819be44ad69820f932050a26e2ca575a11344';
COUNT=$((COUNT+1))

# 301/549: Billy'\''s Roofing
echo "  [301/549] Would quarantine: Billy'\''s Roofing (ba92c8e0d0dce5dc...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='ba92c8e0d0dce5dc1c067c3898a58109257360673e8e457986567544709cf21f';
COUNT=$((COUNT+1))

# 302/549: Bruttell Roofing, Inc.
echo "  [302/549] Would quarantine: Bruttell Roofing, Inc. (7f908d8051d617c2...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='7f908d8051d617c23fb26b6bc121f184272e6dc1107b081173220b6eb2ff2c83';
COUNT=$((COUNT+1))

# 303/549: Bison Plumbing
echo "  [303/549] Would quarantine: Bison Plumbing (fa1bf86b1616bc3a...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='fa1bf86b1616bc3a9b356e29ece79726b310df06cb79e63e9acec393bf530832';
COUNT=$((COUNT+1))

# 304/549: WAYNE COUNTY HVAC LLC
echo "  [304/549] Would quarantine: WAYNE COUNTY HVAC LLC (5276bdbff1460948...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='5276bdbff146094897ac6cf8b5a545d24b5e7c82e0fb50bff81a82f82a9a24b7';
COUNT=$((COUNT+1))

# 305/549: Touchstone Electric Raleigh
echo "  [305/549] Would quarantine: Touchstone Electric Raleigh (24eab590a91c2839...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='24eab590a91c2839ab13ff3913d4011af3053c2fb0cfdad2e2301e0f1ba71814';
COUNT=$((COUNT+1))

# 306/549: ELECTRIC ALL PRO
echo "  [306/549] Would quarantine: ELECTRIC ALL PRO (88716c218e477afb...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='88716c218e477afbe37560e963f5b8021b7720cb6873c17ce9e0ef026a102e7a';
COUNT=$((COUNT+1))

# 307/549: Express Electrical Service
echo "  [307/549] Would quarantine: Express Electrical Service (cf87ed6fbd8593ff...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='cf87ed6fbd8593ff8ba5b45233ca0028c678894a48703db159e3172144e2f31d';
COUNT=$((COUNT+1))

# 308/549: Simple Construction Roofing
echo "  [308/549] Would quarantine: Simple Construction Roofing (c2a40f4b818e2994...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='c2a40f4b818e2994c8b328262ffff65819739becdfbd92a5d05366f199f4394e';
COUNT=$((COUNT+1))

# 309/549: Roof Dawgs
echo "  [309/549] Would quarantine: Roof Dawgs (189b031a169f76e2...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='189b031a169f76e2079c67068a7b77abe72dca05c528f942c4859b1cb47c523a';
COUNT=$((COUNT+1))

# 310/549: Dana Dean Roofing Company
echo "  [310/549] Would quarantine: Dana Dean Roofing Company (a2dd5cee99e05531...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='a2dd5cee99e0553191b4d92fca0a978121e44317d4d2b6f81e00d3662ed7e4d8';
COUNT=$((COUNT+1))

# 311/549: Roofwerks, Inc.
echo "  [311/549] Would quarantine: Roofwerks, Inc. (407dd273d6a5db96...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='407dd273d6a5db968837637c0f4d68af34096921ee978b83caf5f464c6ef16b8';
COUNT=$((COUNT+1))

# 312/549: Southern Premier Roofing
echo "  [312/549] Would quarantine: Southern Premier Roofing (e088e835aedb3871...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='e088e835aedb3871bddbbee26ac8418f3ba37ae99780a5bac0b73b812e983b12';
COUNT=$((COUNT+1))

# 313/549: Raleigh Roofers LLC
echo "  [313/549] Would quarantine: Raleigh Roofers LLC (eb01824aed9e58f9...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='eb01824aed9e58f9766a218fb39d6210ccb7edc4f389bd06e0183904f1645079';
COUNT=$((COUNT+1))

# 314/549: J. R. Lane Plumbing Co.
echo "  [314/549] Would quarantine: J. R. Lane Plumbing Co. (ee46a45f76ace4ad...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='ee46a45f76ace4ad0667f6739613e7f94e14f3fa47764de025b53ed5499b7249';
COUNT=$((COUNT+1))

# 315/549: Optimal Plumbing Solutions, Inc.
echo "  [315/549] Would quarantine: Optimal Plumbing Solutions, Inc. (2c128aa581ab45cf...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='2c128aa581ab45cfbc40f3433c0e98aff820f7fb61178482c1811535b45a33f0';
COUNT=$((COUNT+1))

# 316/549: Godby Heating Plumbing Electrical
echo "  [316/549] Would quarantine: Godby Heating Plumbing Electrical (8f9149bbcdd8711f...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='8f9149bbcdd8711f1426d50bb2aaeaeb97d7c602e0611ddae8ee4faf5b72b25b';
COUNT=$((COUNT+1))

# 317/549: Zimmerman Electric Indy
echo "  [317/549] Would quarantine: Zimmerman Electric Indy (f5c15e96745313da...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='f5c15e96745313da5c94dcd3607f78ed42e1abe8d120fac1fbffee230c5e6064';
COUNT=$((COUNT+1))

# 318/549: DAVID-ELECTRIC
echo "  [318/549] Would quarantine: DAVID-ELECTRIC (a58053a19e9c086d...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='a58053a19e9c086d4c20f304653c45b2e0d6a3507edb0f64b8cdc16f5248a3d7';
COUNT=$((COUNT+1))

# 319/549: WaterTight Roofing Indy
echo "  [319/549] Would quarantine: WaterTight Roofing Indy (02086a24fb78ff25...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='02086a24fb78ff256e18c382d69543bf83c816dee05433b41ae58df50d5b8e03';
COUNT=$((COUNT+1))

# 320/549: Trojan Roofing
echo "  [320/549] Would quarantine: Trojan Roofing (ca8305aaeb3babb7...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='ca8305aaeb3babb71f406e542d12cec70f4d513655e5bdc0163e5bd25703bac1';
COUNT=$((COUNT+1))

# 321/549: Two Brothers Roofing Inc
echo "  [321/549] Would quarantine: Two Brothers Roofing Inc (32a99977500d6c45...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='32a99977500d6c45034b4d3e3816a992aea594fe4907c1ed7001e361438a7cc2';
COUNT=$((COUNT+1))

# 322/549: Raptor Roofing
echo "  [322/549] Would quarantine: Raptor Roofing (d222d211b0cec850...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='d222d211b0cec850d73f4d11b7431f615a6543360a5caaf6f0643f466239361e';
COUNT=$((COUNT+1))

# 323/549: Indianapolis Roofing LLC
echo "  [323/549] Would quarantine: Indianapolis Roofing LLC (27e8d314d359d46c...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='27e8d314d359d46cc738ac10d741a01a5917dc0bd53cfa8f637ea0843eb97319';
COUNT=$((COUNT+1))

# 324/549: Stay Dry Roofing
echo "  [324/549] Would quarantine: Stay Dry Roofing (0ef80ded04eed8ae...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='0ef80ded04eed8ae546dee9c31490990572463a74f1db3d29d3b5b6f3eb75ca3';
COUNT=$((COUNT+1))

# 325/549: Indy Rooftops - Roofing Replacement Contractor
echo "  [325/549] Would quarantine: Indy Rooftops - Roofing Replacement Contractor (fbc1206d9f37199b...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='fbc1206d9f37199be99cab3b6ba05d405a0599e8d4d44441b52924bc3816b888';
COUNT=$((COUNT+1))

# 326/549: Bone Dry Roofing
echo "  [326/549] Would quarantine: Bone Dry Roofing (423b309fb59eca8d...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='423b309fb59eca8db8a9c27f1565472deaaeb62b55f56d086d57f91740e1aa71';
COUNT=$((COUNT+1))

# 327/549: Indy Roof & Restoration
echo "  [327/549] Would quarantine: Indy Roof & Restoration (b3d40afade067c90...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='b3d40afade067c9015dbb4383c812bd2ce5e979bf776eae881323d0a920b7f09';
COUNT=$((COUNT+1))

# 328/549: Plumbing Heating & Air Conditioning Paramedics
echo "  [328/549] Would quarantine: Plumbing Heating & Air Conditioning Paramedics (9eb25ef58584b80d...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='9eb25ef58584b80d07a7f9c0fe768e7a5df6973d3996a5ff898375e0415a2aa0';
COUNT=$((COUNT+1))

# 329/549: Carter'\''s My Plumber
echo "  [329/549] Would quarantine: Carter'\''s My Plumber (8ab94d4f67d4ad98...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='8ab94d4f67d4ad986ae76bb0278fb6e1f62ecfe185af28c4e4629b7ddfd8848b';
COUNT=$((COUNT+1))

# 330/549: Carter'\''s My Plumber - Drain Cleaning Indianapolis & Sewer Line Repair
echo "  [330/549] Would quarantine: Carter'\''s My Plumber - Drain Cleaning Indianapolis & Sewer Line Repair (c76f7656565c4461...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='c76f7656565c4461b957f0d478aabc9a4b852f2f1e8e055df026f5b7e6c677ea';
COUNT=$((COUNT+1))

# 331/549: All Pro Heating, Air and Plumbing
echo "  [331/549] Would quarantine: All Pro Heating, Air and Plumbing (9ef06647c26f077b...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='9ef06647c26f077bc32374900629b980f9c8fdc1231bba69912033706034c075';
COUNT=$((COUNT+1))

# 332/549: Northern Comfort Systems
echo "  [332/549] Would quarantine: Northern Comfort Systems (366a733398b42734...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='366a733398b42734dac1cfafc1395d5d06ddc0d1d9386cb63acafa24f5aac9d6';
COUNT=$((COUNT+1))

# 333/549: Roy Rogers Heating & Air
echo "  [333/549] Would quarantine: Roy Rogers Heating & Air (eb13f9d5c5f60f2f...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='eb13f9d5c5f60f2f2b40a9ab6d0097b979f90923cc4ebcad08b99a36b3edf83b';
COUNT=$((COUNT+1))

# 334/549: LCS Heating and Cooling
echo "  [334/549] Would quarantine: LCS Heating and Cooling (0d6d4d54674b95f4...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='0d6d4d54674b95f4faea701af4ca7b00f7cc155e504c2d8617f612d4ae22c3de';
COUNT=$((COUNT+1))

# 335/549: Care Electric LLC
echo "  [335/549] Would quarantine: Care Electric LLC (f68ccab27ebc5f5e...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='f68ccab27ebc5f5e8f2020da8ac2b3993036d5f11b48b76751eddb7ef4ff9311';
COUNT=$((COUNT+1))

# 336/549: R & T Yoder Electric, Inc - Central Columbus
echo "  [336/549] Would quarantine: R & T Yoder Electric, Inc - Central Columbus (44f47d8810fdfdc6...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='44f47d8810fdfdc6746b3f5103bbd7047e9a5e21b210fc4cd8a2f7d011d1295b';
COUNT=$((COUNT+1))

# 337/549: Buckeye Electric of Upper Arlington
echo "  [337/549] Would quarantine: Buckeye Electric of Upper Arlington (0d5fc559804986b2...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='0d5fc559804986b26e406b2a08678fb4083a06201479570a7fa382538f896f9b';
COUNT=$((COUNT+1))

# 338/549: Right Way Roofing
echo "  [338/549] Would quarantine: Right Way Roofing (320381ada33f4c7e...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='320381ada33f4c7e6a193ae46e3b99effe76f60809b54847c56155be3021e7d0';
COUNT=$((COUNT+1))

# 339/549: Mighty Dog Roofing of Columbus West
echo "  [339/549] Would quarantine: Mighty Dog Roofing of Columbus West (d284dd729b7f58e8...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='d284dd729b7f58e867e56175707f42b909208d942c968322f66969995b15c693';
COUNT=$((COUNT+1))

# 340/549: Roof Revivers
echo "  [340/549] Would quarantine: Roof Revivers (16a6cd9a78f7f814...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='16a6cd9a78f7f814b43c4eb7e7fe45f6fdd8d59ebc064d69a771f65ed278f2d8';
COUNT=$((COUNT+1))

# 341/549: Able Roofing
echo "  [341/549] Would quarantine: Able Roofing (4fb3a7537a48bdfd...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='4fb3a7537a48bdfd8beaf5f2dc5e9112f6b20f9f0cfc40522ba6c83f8ba025c4';
COUNT=$((COUNT+1))

# 342/549: Columbus Roofing Company
echo "  [342/549] Would quarantine: Columbus Roofing Company (ce9b43f37fd9c1c1...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='ce9b43f37fd9c1c18d90067e55483b47902d4f6288dadb8c5a61dd3b4a6cb6f0';
COUNT=$((COUNT+1))

# 343/549: Transit & Flow Plumbing
echo "  [343/549] Would quarantine: Transit & Flow Plumbing (5360a5795159bbe9...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='5360a5795159bbe9d284e849e8aca84a5e70ceba42b7b7a2f326d869bf790afd';
COUNT=$((COUNT+1))

# 344/549: Northland Heating & Air Conditioning
echo "  [344/549] Would quarantine: Northland Heating & Air Conditioning (6901bf18832c9eb3...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='6901bf18832c9eb33e94b77d59c770c62f2d8ec1642398bbfe27815bd2c7114b';
COUNT=$((COUNT+1))

# 345/549: Hetter Heating & Cooling
echo "  [345/549] Would quarantine: Hetter Heating & Cooling (11ef62940cf3a450...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='11ef62940cf3a4508a269c1430f74ddbfbbeabb81277383f317454140906f63c';
COUNT=$((COUNT+1))

# 346/549: Groves Electric, Inc.
echo "  [346/549] Would quarantine: Groves Electric, Inc. (3b6569686d42772a...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='3b6569686d42772ac3c4fc6f8e6b1008d00e57d2911d4e11612c01937ef0a578';
COUNT=$((COUNT+1))

# 347/549: Aguila Electrical Services Inc
echo "  [347/549] Would quarantine: Aguila Electrical Services Inc (a504a693c8a13e8b...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='a504a693c8a13e8b4aa8696edfae53f0b5bef9ccac362c403c3f2df25d504194';
COUNT=$((COUNT+1))

# 348/549: Acme Electrical Services
echo "  [348/549] Would quarantine: Acme Electrical Services (07fbe2dd48973d48...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='07fbe2dd48973d48aa413b46cbe9c26c4d5a33a9db3e80804951a16e0d2bb212';
COUNT=$((COUNT+1))

# 349/549: Five Star Roofing and Construction, Inc.
echo "  [349/549] Would quarantine: Five Star Roofing and Construction, Inc. (f7d030adc304c8af...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='f7d030adc304c8af0443b243b53da6eec2762d878fe13c4a14b618bc6e275457';
COUNT=$((COUNT+1))

# 350/549: Evans Roofing of Tampa Bay
echo "  [350/549] Would quarantine: Evans Roofing of Tampa Bay (0a9af16c876eccf2...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='0a9af16c876eccf26a4e7bd076aa54aaf84e06363c3cb1ea51391cad0cc17e27';
COUNT=$((COUNT+1))

# 351/549: The Roofing Company
echo "  [351/549] Would quarantine: The Roofing Company (9a1c8bc2dfc69dfe...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='9a1c8bc2dfc69dfe1a10b7089262ddb8b0238079de9be1ec1d288afbcbad143e';
COUNT=$((COUNT+1))

# 352/549: SCM Roofing, LLC
echo "  [352/549] Would quarantine: SCM Roofing, LLC (1eea3866f323b085...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='1eea3866f323b085bab314efd3d6c28b9c89c5fcc900bf97e89f9ca591f1f7bd';
COUNT=$((COUNT+1))

# 353/549: Fix Roofing LLC
echo "  [353/549] Would quarantine: Fix Roofing LLC (79be257de68b6fea...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='79be257de68b6feac3bebf81fc3e56e8c9622edaec2320e7330d24b50c078b35';
COUNT=$((COUNT+1))

# 354/549: ROOF PANDA LLC
echo "  [354/549] Would quarantine: ROOF PANDA LLC (5aebb7f865871394...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='5aebb7f86587139454f9d3d5addccaba38b0c8a0f12e533102f64ec83f8dd6c5';
COUNT=$((COUNT+1))

# 355/549: Mr. Rooter Plumbing of Tampa
echo "  [355/549] Would quarantine: Mr. Rooter Plumbing of Tampa (7db276d0ef58ca24...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='7db276d0ef58ca243e1b6df1cd2947db07839d21d2a831a5295675bd0a28e096';
COUNT=$((COUNT+1))

# 356/549: Rolando'\''s H.V.A.C.
echo "  [356/549] Would quarantine: Rolando'\''s H.V.A.C. (6380f474d8b51c1c...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='6380f474d8b51c1c4dd7f3e117ebfae61a26fc88446d4d1e6ad9676451aefe34';
COUNT=$((COUNT+1))

# 357/549: The Comfort Authority
echo "  [357/549] Would quarantine: The Comfort Authority (8c0043d0b72570b8...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='8c0043d0b72570b88c0992888271dbaa22ab41731ef9dd020c25440166e6fdec';
COUNT=$((COUNT+1))

# 358/549: Nominal Voltage Contractors
echo "  [358/549] Would quarantine: Nominal Voltage Contractors (e23ebebf1373249b...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='e23ebebf1373249b135762bd0319cbd5b90ea6a317503b9a77f54c0fcc66eda7';
COUNT=$((COUNT+1))

# 359/549: Sky Light Roofing Inc.
echo "  [359/549] Would quarantine: Sky Light Roofing Inc. (ea91649e81c1f362...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='ea91649e81c1f362367940cd0266243bf802e306a4e5b4a324cf8e011b87193e';
COUNT=$((COUNT+1))

# 360/549: Orlando Roof Tech
echo "  [360/549] Would quarantine: Orlando Roof Tech (90dbd364bf9ca9ab...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='90dbd364bf9ca9ab485b7600fb6430962ecc93700a0a5eb25697f92fb89964d3';
COUNT=$((COUNT+1))

# 361/549: New Standard Roofing Orlando
echo "  [361/549] Would quarantine: New Standard Roofing Orlando (fb31e00e22ceec3b...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='fb31e00e22ceec3bbb7b56aeb94fef39ca470662bf65d1ae5f50c243c7696af6';
COUNT=$((COUNT+1))

# 362/549: Schick Roofing
echo "  [362/549] Would quarantine: Schick Roofing (cb2bac8bde57dbda...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='cb2bac8bde57dbdaa3db48fa23276fb543974869fe0ae0d60f74e7a78d53adb0';
COUNT=$((COUNT+1))

# 363/549: Orlando Roofing Company
echo "  [363/549] Would quarantine: Orlando Roofing Company (fea1d1ce9fbbd9f6...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='fea1d1ce9fbbd9f63438508cb61763ac622587c7b3cb9553f26c83a822f0bb5c';
COUNT=$((COUNT+1))

# 364/549: Next Level Roofers
echo "  [364/549] Would quarantine: Next Level Roofers (79e03c1be8ed16fa...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='79e03c1be8ed16fa6450d76655c4adecb2427d0d6c181346b1e3c93efb34b9c1';
COUNT=$((COUNT+1))

# 365/549: Gold Key Roofing
echo "  [365/549] Would quarantine: Gold Key Roofing (60628e682bf589be...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='60628e682bf589be79e0dd993c02dcbc319876f87d3d01db876e4e8799698fa5';
COUNT=$((COUNT+1))

# 366/549: Gravity Roofing
echo "  [366/549] Would quarantine: Gravity Roofing (77e80e405fab8340...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='77e80e405fab83409ef19d14006bc3fe110598c5a31fd6b64ccb1ab7c9943806';
COUNT=$((COUNT+1))

# 367/549: Modern Plumbing Industries, Inc.
echo "  [367/549] Would quarantine: Modern Plumbing Industries, Inc. (0536cd2f8826855c...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='0536cd2f8826855c8be08ef62ac89287926de88b36900f0abf72661af671d24c';
COUNT=$((COUNT+1))

# 368/549: Frank Gay Services
echo "  [368/549] Would quarantine: Frank Gay Services (88b77a1a6d29b2a2...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='88b77a1a6d29b2a230021071a603585ed3139501db85c8fa16991cc2cff5b634';
COUNT=$((COUNT+1))

# 369/549: Bob Heinmiller Air Conditioning Inc
echo "  [369/549] Would quarantine: Bob Heinmiller Air Conditioning Inc (cbd588c9bae62c94...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='cbd588c9bae62c9440f46f651889861e912be836291e4703c571ed272dba7691';
COUNT=$((COUNT+1))

# 370/549: Our Place Air & Home Repair
echo "  [370/549] Would quarantine: Our Place Air & Home Repair (f80d1f2bb99fa27f...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='f80d1f2bb99fa27f7c4fc4fde3ef26e14b732a67b60aa718d4bbc3031b537451';
COUNT=$((COUNT+1))

# 371/549: Excalibur Electrician
echo "  [371/549] Would quarantine: Excalibur Electrician (c6f9021adc86224b...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='c6f9021adc86224b280a93e3cc6e47a05e95228ea6118a13b6eefb0a48bc9586';
COUNT=$((COUNT+1))

# 372/549: Hometown Pro Nashville Electrician
echo "  [372/549] Would quarantine: Hometown Pro Nashville Electrician (6a363e21d20df896...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='6a363e21d20df896b9e0dfdfc7777d4c2719fbfdab6b2ebeffbfd03b8400c7a4';
COUNT=$((COUNT+1))

# 373/549: Nashville Roofing Company
echo "  [373/549] Would quarantine: Nashville Roofing Company (cee5a4d1e66b8c47...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='cee5a4d1e66b8c47932ee32fa14574799cb392c94844fa53f95b86d271e6b95e';
COUNT=$((COUNT+1))

# 374/549: Southern Roofing Co.
echo "  [374/549] Would quarantine: Southern Roofing Co. (80fb6e84e4660172...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='80fb6e84e4660172eedac48039000bc1329ef4505e766b5edc3e3b45836f852c';
COUNT=$((COUNT+1))

# 375/549: Holt Plumbing Company
echo "  [375/549] Would quarantine: Holt Plumbing Company (cac814e33a89c642...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='cac814e33a89c642ce04d89cf9cd2a73020b0913349d978d361ec1c7226f1b49';
COUNT=$((COUNT+1))

# 376/549: 1-Tom-Plumber
echo "  [376/549] Would quarantine: 1-Tom-Plumber (7a4b660dc13512de...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='7a4b660dc13512de273eba5053a4ae6c99e2485816f90816ad288a42ef9adc96';
COUNT=$((COUNT+1))

# 377/549: Air Conditioning Service, Inc
echo "  [377/549] Would quarantine: Air Conditioning Service, Inc (6d849dba79e7f8ef...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='6d849dba79e7f8ef50daef919b0fd91cfbb029ed90ba3da5725369f48a73d2ef';
COUNT=$((COUNT+1))

# 378/549: Mr. Electric of Charlotte Metro
echo "  [378/549] Would quarantine: Mr. Electric of Charlotte Metro (7300e7673db90547...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='7300e7673db9054731debc1f571c7be68f73cfaca6f7f8c8c769dd5ad86e729d';
COUNT=$((COUNT+1))

# 379/549: Charlotte Ace Roofing
echo "  [379/549] Would quarantine: Charlotte Ace Roofing (e0c625aea8e2fb5c...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='e0c625aea8e2fb5c5bf6fb6ac3827d523bfd9943ce09df281e851b1519c92e9c';
COUNT=$((COUNT+1))

# 380/549: Ross & Witmer Heating & Air Conditioning
echo "  [380/549] Would quarantine: Ross & Witmer Heating & Air Conditioning (ff3f577a04dd9dc8...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='ff3f577a04dd9dc8deb65a2ea003bd9dafce004de4f11dec04d7518e622746a8';
COUNT=$((COUNT+1))

# 381/549: Charlotte Heating & Air
echo "  [381/549] Would quarantine: Charlotte Heating & Air (4ae4f74ecb6ca780...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='4ae4f74ecb6ca7803dc8e395fd66412ce007e7c387bd0c2d92da7076f0c09950';
COUNT=$((COUNT+1))

# 382/549: Capital City Electrical Services, LLC
echo "  [382/549] Would quarantine: Capital City Electrical Services, LLC (887b066c868ab4c3...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='887b066c868ab4c3ea1ea5a51cee9856d36dda69a5d18be093b7d705c5d715f8';
COUNT=$((COUNT+1))

# 383/549: Mosaic Roofing Company LLC
echo "  [383/549] Would quarantine: Mosaic Roofing Company LLC (63715ed39e6dd906...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='63715ed39e6dd906e36c14b8ca58c817443835de8b0ae0110e0ac404c1988739';
COUNT=$((COUNT+1))

# 384/549: Bell Roofing
echo "  [384/549] Would quarantine: Bell Roofing (92ad8bf7a7e1942f...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='92ad8bf7a7e1942f29bc2c43c0fecfb20ea93fcfac4a7ac2558e72216070a218';
COUNT=$((COUNT+1))

# 385/549: Castle Roofing Atlanta, GA
echo "  [385/549] Would quarantine: Castle Roofing Atlanta, GA (87c75c3f41c0cd81...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='87c75c3f41c0cd81872e42ce293ad4fb0104ac5d13617f321038b35f33e08469';
COUNT=$((COUNT+1))

# 386/549: Peach Plumbing & Drain Atlanta Plumber
echo "  [386/549] Would quarantine: Peach Plumbing & Drain Atlanta Plumber (145772a879bdf4e7...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='145772a879bdf4e73902387040e54a644490f57aa6e36a0f74a9b9c4dc3ec975';
COUNT=$((COUNT+1))

# 387/549: Reliable Heating & Air, Plumbing and Electrical - Kennesaw
echo "  [387/549] Would quarantine: Reliable Heating & Air, Plumbing and Electrical - Kennesaw (e9045dee85d7a210...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='e9045dee85d7a21004b6d6b515103c1455409e079529603a1fcf3ded69253956';
COUNT=$((COUNT+1))

# 388/549: PV Heating, Cooling & Plumbing
echo "  [388/549] Would quarantine: PV Heating, Cooling & Plumbing (fa674552e273c7b8...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='fa674552e273c7b8c5dc794aac109b2a95ba24fb4df468f25731b2aa0d37480f';
COUNT=$((COUNT+1))

# 389/549: Callahan Electric
echo "  [389/549] Would quarantine: Callahan Electric (39ddbf697fa50abc...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='39ddbf697fa50abcc7d1ecccab75861f3a0ebcee5799ae1523f905e7cee97b9f';
COUNT=$((COUNT+1))

# 390/549: Geek Roofing
echo "  [390/549] Would quarantine: Geek Roofing (f23487551c3e3289...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='f23487551c3e32899e4b191d3835d1112404638313099df8c6e7a68405dfa764';
COUNT=$((COUNT+1))

# 391/549: Henco Plumbing Services
echo "  [391/549] Would quarantine: Henco Plumbing Services (978314346818de11...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='978314346818de114e995cb1382be26c57000b44d01fa7854d709a54105fcb7b';
COUNT=$((COUNT+1))

# 392/549: Plumbing and Sewer Renewal Specialists
echo "  [392/549] Would quarantine: Plumbing and Sewer Renewal Specialists (f4288942390008b8...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='f4288942390008b811cef54f568d65d0c3f3bfb168fdf0dd5294b12b59aad9f0';
COUNT=$((COUNT+1))

# 393/549: Cornel'\''s Plumbing, Heating & Air Conditioning
echo "  [393/549] Would quarantine: Cornel'\''s Plumbing, Heating & Air Conditioning (9135b105b7f9a373...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='9135b105b7f9a373a7c29b183abd466d1e6f848b5d7f181ef6f58c51ec3f3076';
COUNT=$((COUNT+1))

# 394/549: Perfect Service Plumbing and Drain Cleaning
echo "  [394/549] Would quarantine: Perfect Service Plumbing and Drain Cleaning (10b7e4bcbf4569bb...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='10b7e4bcbf4569bb3d11398d5f86cc82adb5b660ef0dc026a9fe241690f0908a';
COUNT=$((COUNT+1))

# 395/549: Efficiency Heating & Cooling
echo "  [395/549] Would quarantine: Efficiency Heating & Cooling (a6ae369dda1d97b3...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='a6ae369dda1d97b36677f761372f308c948f4577fedef17b46f2bc05ecd420c8';
COUNT=$((COUNT+1))

# 396/549: Central Air Heating, Cooling & Plumbing
echo "  [396/549] Would quarantine: Central Air Heating, Cooling & Plumbing (e48da029672f20c9...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='e48da029672f20c9da2a13de4404ecc78d5c5fecad3fd86a6d083db0ceb62554';
COUNT=$((COUNT+1))

# 397/549: Sky Heating, AC, Plumbing & Electrical
echo "  [397/549] Would quarantine: Sky Heating, AC, Plumbing & Electrical (4ce09c8423d2fd05...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='4ce09c8423d2fd05f34927113cd60d490bccf70f55d6dbab1073916b0dd3a11b';
COUNT=$((COUNT+1))

# 398/549: Sunset Heating & Cooling
echo "  [398/549] Would quarantine: Sunset Heating & Cooling (7374474e4d427324...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='7374474e4d427324520feb7e764ffcc7616ef49de83cacc20985889486d9bc73';
COUNT=$((COUNT+1))

# 399/549: In-House Electrical Services
echo "  [399/549] Would quarantine: In-House Electrical Services (9d0303139f215fd5...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='9d0303139f215fd5b11d68eda39a03ee054d4eb4072a1137358d247250107c4c';
COUNT=$((COUNT+1))

# 400/549: Tekline Roofing
echo "  [400/549] Would quarantine: Tekline Roofing (62f2a8b19820e28f...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='62f2a8b19820e28f4d4611a6de29725562304cdf37d2597e0503872aeb7b53ac';
COUNT=$((COUNT+1))

# 401/549: Forever Roofing
echo "  [401/549] Would quarantine: Forever Roofing (3d0a4e9017d7d2e8...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='3d0a4e9017d7d2e8b83f8c3f800046a4b36e0a6455a70d3e2ad7f28b218830a2';
COUNT=$((COUNT+1))

# 402/549: NearMe Roofing Company
echo "  [402/549] Would quarantine: NearMe Roofing Company (34a762885ec95ef6...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='34a762885ec95ef6340a14ba7c94842c825076fda650ac112ac51b8347beddbf';
COUNT=$((COUNT+1))

# 403/549: Anthony'\''s Plumbing
echo "  [403/549] Would quarantine: Anthony'\''s Plumbing (55e1a13db127d014...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='55e1a13db127d014c4c4c05da421b07a00a9a6732f895736cec51162b46a4838';
COUNT=$((COUNT+1))

# 404/549: Mr. Rooter Plumbing of Seattle
echo "  [404/549] Would quarantine: Mr. Rooter Plumbing of Seattle (36bfa89d8d0a5e90...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='36bfa89d8d0a5e9090515583b01d56b55749a2110e00c2ac7ea974ee03c3b406';
COUNT=$((COUNT+1))

# 405/549: Eco Electric, Plumbing, Heating and Air
echo "  [405/549] Would quarantine: Eco Electric, Plumbing, Heating and Air (4fa9fbf252f8797e...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='4fa9fbf252f8797e572ccb66a2529ae3955b5b5842215baed08d20121e276949';
COUNT=$((COUNT+1))

# 406/549: Greenwood Heating and Home Services
echo "  [406/549] Would quarantine: Greenwood Heating and Home Services (9828bcecfb870671...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='9828bcecfb870671420675502d815ec84da28ed8a563cba749896861b01d071c';
COUNT=$((COUNT+1))

# 407/549: The Electricians
echo "  [407/549] Would quarantine: The Electricians (6b9c6971a6ad3119...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='6b9c6971a6ad31192bc3d4b8b53cf024ce8cb18fa4a5230f3dcc1f88babc1096';
COUNT=$((COUNT+1))

# 408/549: JM Electric Inc.
echo "  [408/549] Would quarantine: JM Electric Inc. (550443c7a9b44eef...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='550443c7a9b44eefdd83fb8133d625e528db8e4243a04088a49afd0bb4579736';
COUNT=$((COUNT+1))

# 409/549: Denver Electricians
echo "  [409/549] Would quarantine: Denver Electricians (2f54cfa152a0f318...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='2f54cfa152a0f318b7451d5e24b941639a3c08edf44249cf38fce49d33e85f07';
COUNT=$((COUNT+1))

# 410/549: Formula Roofing and Remodeling
echo "  [410/549] Would quarantine: Formula Roofing and Remodeling (eb809d21727407d0...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='eb809d21727407d0891036fe41ca75851f2c49fc5cc576d626aa7c7923dded37';
COUNT=$((COUNT+1))

# 411/549: Speed plumbing
echo "  [411/549] Would quarantine: Speed plumbing (307b1b9af11aecf6...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='307b1b9af11aecf6c8f29203331cebab07ecf6068dcf7f146e868fa7a00b57bc';
COUNT=$((COUNT+1))

# 412/549: Squeaks Services Plumbing Heating & Air - Denver
echo "  [412/549] Would quarantine: Squeaks Services Plumbing Heating & Air - Denver (e29f5bc2a63cc593...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='e29f5bc2a63cc593a9ec4bfa70cd9249270d7d8ed9663229991c958e4d762527';
COUNT=$((COUNT+1))

# 413/549: Absolute Plumbing, Electrical, Heating & Air
echo "  [413/549] Would quarantine: Absolute Plumbing, Electrical, Heating & Air (0c7c5f3fa3dca89a...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='0c7c5f3fa3dca89ad276cf69742848d59819f17628d262e3d3a36a34b1767d06';
COUNT=$((COUNT+1))

# 414/549: Right Away Heating
echo "  [414/549] Would quarantine: Right Away Heating (6dc3bee907b0cb20...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='6dc3bee907b0cb20b06719811f103268374087798f897a210378fbd12135a5b6';
COUNT=$((COUNT+1))

# 415/549: E&P Electrical services
echo "  [415/549] Would quarantine: E&P Electrical services (066b08e85b367238...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='066b08e85b3672385546790db5c01a71f06af47170162463e4585ae43344ad79';
COUNT=$((COUNT+1))

# 416/549: Mainland Roofing Company
echo "  [416/549] Would quarantine: Mainland Roofing Company (1da28b75e261c12f...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='1da28b75e261c12fc5526d98d44019dd101bb1aafeac19b10285d6d357d99f00';
COUNT=$((COUNT+1))

# 417/549: 4EVER ROOFING
echo "  [417/549] Would quarantine: 4EVER ROOFING (ec839fdb1c0d728b...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='ec839fdb1c0d728bb56423302e25334f7c830c538c2c705b6632a0f932a63a29';
COUNT=$((COUNT+1))

# 418/549: Fix Up Roofing and Construction LLC
echo "  [418/549] Would quarantine: Fix Up Roofing and Construction LLC (f08f446d4f971179...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='f08f446d4f971179bff9ea70a7c8bad4bb4f08d8db07724d774b8e3f93b67732';
COUNT=$((COUNT+1))

# 419/549: T&S Roofing Systems
echo "  [419/549] Would quarantine: T&S Roofing Systems (c5b5adf3191d319c...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='c5b5adf3191d319c65e01c303cbcfe22f331f408fbcb4c455d2658dad245d254';
COUNT=$((COUNT+1))

# 420/549: Miami 305 Plumbing
echo "  [420/549] Would quarantine: Miami 305 Plumbing (fb40fa4f29212c15...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='fb40fa4f29212c15e2094d55f5d9d278b096900ece67d4d6db28c509cdde6a46';
COUNT=$((COUNT+1))

# 421/549: Hernandez Plumbing Co.
echo "  [421/549] Would quarantine: Hernandez Plumbing Co. (291f9d92de0455d2...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='291f9d92de0455d2a90fefee4e25b63dd7f6f795303958ed604a8c005f68dcd9';
COUNT=$((COUNT+1))

# 422/549: Ez Plumbing Repair Services
echo "  [422/549] Would quarantine: Ez Plumbing Repair Services (b7619ef2408c47eb...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='b7619ef2408c47ebaeb73662c58300c4488257eec1c66959b8b0d07fd3d90ff3';
COUNT=$((COUNT+1))

# 423/549: Oasis Plumbing
echo "  [423/549] Would quarantine: Oasis Plumbing (7282073de70a44ff...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='7282073de70a44ffc9f6379c1adab146ab501fb0c4e78a6800e643314cf3a589';
COUNT=$((COUNT+1))

# 424/549: Sunny Bliss Plumbing & Air
echo "  [424/549] Would quarantine: Sunny Bliss Plumbing & Air (dd867519d9d54edf...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='dd867519d9d54edf1c1d3ab503d48fe9fbd2aa6937bba7faf771ee1e79d67e36';
COUNT=$((COUNT+1))

# 425/549: Miami Dade Plumbing
echo "  [425/549] Would quarantine: Miami Dade Plumbing (86319c0bc2a8c496...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='86319c0bc2a8c496313c212717baa2cf943f4112abe49d4b5a5c60d9da6dcfb0';
COUNT=$((COUNT+1))

# 426/549: Miami 24/7 Plumbing - Miami Emergency Plumbers
echo "  [426/549] Would quarantine: Miami 24/7 Plumbing - Miami Emergency Plumbers (9bbb2b65fb6b5dce...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='9bbb2b65fb6b5dce306ce5ecf1d6f8128b3c73bf2e0564f6c7cee98360538782';
COUNT=$((COUNT+1))

# 427/549: Emergency AC Corp
echo "  [427/549] Would quarantine: Emergency AC Corp (d8f03f0d491f19b6...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='d8f03f0d491f19b6e2f6425493922d618663c7c6e51a2f82a3ffb365b881ddf3';
COUNT=$((COUNT+1))

# 428/549: AC Repair 24 Seven by Cooling Masters
echo "  [428/549] Would quarantine: AC Repair 24 Seven by Cooling Masters (2f3702c5ef3d420a...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='2f3702c5ef3d420ada3edca6182a6e1b13313ffbe8ac87796e73860aacf669e5';
COUNT=$((COUNT+1))

# 429/549: Freezing Mechanical
echo "  [429/549] Would quarantine: Freezing Mechanical (5d5ea386f0096eb5...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='5d5ea386f0096eb596b1870818d3f1634a377f6ad8c0ab9e7d6f2b9524981795';
COUNT=$((COUNT+1))

# 430/549: Doctor Air Hvac Corp
echo "  [430/549] Would quarantine: Doctor Air Hvac Corp (3a90477f34e5d405...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='3a90477f34e5d4059798b95cf68a853a96bd0d2f642802a294dd6fe584e6cdf9';
COUNT=$((COUNT+1))

# 431/549: Flavin Electric LLC
echo "  [431/549] Would quarantine: Flavin Electric LLC (2c10c256575a2a0b...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='2c10c256575a2a0bfa87aacdc9494077543384d0593681dec72f5fa1573a84b2';
COUNT=$((COUNT+1))

# 432/549: Loboz Electrical
echo "  [432/549] Would quarantine: Loboz Electrical (d8f0d4f453712f09...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='d8f0d4f453712f098e96d1a179b10e32f5079b0ef41e45dab4b8a6d0aefa8df2';
COUNT=$((COUNT+1))

# 433/549: Midwest Roofing
echo "  [433/549] Would quarantine: Midwest Roofing (9be8b7cb597e8077...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='9be8b7cb597e8077951083ce837fd0be24c75eeccf63ec37acd5fefa12dfe2f5';
COUNT=$((COUNT+1))

# 434/549: Perez Roofing & Masonry
echo "  [434/549] Would quarantine: Perez Roofing & Masonry (c22880a453594a17...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='c22880a453594a17ba3c9461d36cb73f85ec691f511e6846176ce1965abc05e5';
COUNT=$((COUNT+1))

# 435/549: Global Heating and Cooling LLC | HVAC
echo "  [435/549] Would quarantine: Global Heating and Cooling LLC | HVAC (ad49e79f2005641d...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='ad49e79f2005641d5ae896e2aa533de97e4685b0ed6a6b83993de5b21f11d799';
COUNT=$((COUNT+1))

# 436/549: Vale City Electric
echo "  [436/549] Would quarantine: Vale City Electric (b42b470cf4157c8e...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='b42b470cf4157c8ea375aa01d51b6f61660a92426188045ff14f07e733d91071';
COUNT=$((COUNT+1))

# 437/549: Coppertown Electric LLC
echo "  [437/549] Would quarantine: Coppertown Electric LLC (44ae88cfd61a9be6...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='44ae88cfd61a9be6a82a6c56199b9bd071f3751fae7c8ec4fb24994dab837f78';
COUNT=$((COUNT+1))

# 438/549: Star Light Electric LLC
echo "  [438/549] Would quarantine: Star Light Electric LLC (e4fe975df4967e09...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='e4fe975df4967e09f5ebd4e7cd5ebc0812c8e25a0db966a22ff74f12895a0a29';
COUNT=$((COUNT+1))

# 439/549: The Aussie Plumber
echo "  [439/549] Would quarantine: The Aussie Plumber (52e07b47bd5d06de...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='52e07b47bd5d06de49d2cd90e3d60af57e5126e8f72be0de1830ec0ff174e979';
COUNT=$((COUNT+1))

# 440/549: APES HVAC & Plumbing
echo "  [440/549] Would quarantine: APES HVAC & Plumbing (24aa813f8718cd3a...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='24aa813f8718cd3aba99372db24a22d290e97591974525bbf0196624b512d911';
COUNT=$((COUNT+1))

# 441/549: North Valley Mechanical HVAC & Plumbing
echo "  [441/549] Would quarantine: North Valley Mechanical HVAC & Plumbing (3bec2959f6a03f00...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='3bec2959f6a03f00081b11ab291846d2553fabc52c68718379ea64dd600cf70d';
COUNT=$((COUNT+1))

# 442/549: Matthew Lorand Roofing
echo "  [442/549] Would quarantine: Matthew Lorand Roofing (560b02c7fa50f730...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='560b02c7fa50f73059bead8460a5f2182f322e5d440dc6e9141c517b22668722';
COUNT=$((COUNT+1))

# 443/549: Kidd Roofing
echo "  [443/549] Would quarantine: Kidd Roofing (ef8ec75f12267ba6...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='ef8ec75f12267ba6033323bb74d776bf53c1e4dca553de45d3335b26ea3af34a';
COUNT=$((COUNT+1))

# 444/549: Wilson Roofing
echo "  [444/549] Would quarantine: Wilson Roofing (02609cedc85c9962...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='02609cedc85c996270ec85dbf1dd6477c78e4ae5546f89ac380c8924e43beaa1';
COUNT=$((COUNT+1))

# 445/549: Apex Roofing & General Contractors
echo "  [445/549] Would quarantine: Apex Roofing & General Contractors (831632326da371ac...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='831632326da371acb0eded6fe05fc988e81174e600acf7118bb339b6847d7563';
COUNT=$((COUNT+1))

# 446/549: Premier Roofing and Contracting
echo "  [446/549] Would quarantine: Premier Roofing and Contracting (aba583a802544729...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='aba583a80254472925cb53fe8a9d1be17339366139e44b200826d82924fc9c90';
COUNT=$((COUNT+1))

# 447/549: Reliant Plumbing
echo "  [447/549] Would quarantine: Reliant Plumbing (0870f1a181ce6501...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='0870f1a181ce65012608fabbc6315cd655642c026b8a6740320b79cbfe8b519a';
COUNT=$((COUNT+1))

# 448/549: PlumbSmart
echo "  [448/549] Would quarantine: PlumbSmart (6f1256dbfcfaf54d...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='6f1256dbfcfaf54de30bdf3d06bd4ad1883b4c0b465352a969a7371ed1b80f90';
COUNT=$((COUNT+1))

# 449/549: ReliaBee Air Electric Plumbing
echo "  [449/549] Would quarantine: ReliaBee Air Electric Plumbing (b9892d204e0cbc4a...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='b9892d204e0cbc4a200bdbe8b1101c0be88e66d3e73f89b58683e994f288da8d';
COUNT=$((COUNT+1))

# 450/549: All About Air Conditioning & Heating LLC
echo "  [450/549] Would quarantine: All About Air Conditioning & Heating LLC (391b294a0a707830...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='391b294a0a707830577cea9e1c27bc2617673a18aeead0a42fe5311c83095262';
COUNT=$((COUNT+1))

# 451/549: W3 Electric
echo "  [451/549] Would quarantine: W3 Electric (a34ffacdcd0f5f0c...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='a34ffacdcd0f5f0c3f51efe6e5c36c971767948deb69f5241cf1cf496effb560';
COUNT=$((COUNT+1))

# 452/549: Knox Roofing
echo "  [452/549] Would quarantine: Knox Roofing (fdfb43a52291cc3b...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='fdfb43a52291cc3b44c776b4c82e53b066e2b265714afc964cdfb01c3f14bd36';
COUNT=$((COUNT+1))

# 453/549: Sunshine Roofing & Remodeling
echo "  [453/549] Would quarantine: Sunshine Roofing & Remodeling (6e0ec2f95f88951d...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='6e0ec2f95f88951d74b98152067a2f8f6f271b86cd761805305553169ed8bb17';
COUNT=$((COUNT+1))

# 454/549: Reveles Roofing
echo "  [454/549] Would quarantine: Reveles Roofing (2a87980ebd1be223...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='2a87980ebd1be223de75db706011c7a0eb0e9bb25dfd3bd363c9c0e421778382';
COUNT=$((COUNT+1))

# 455/549: Bold Roofing - DFW'\''s Best Roofing Contractor
echo "  [455/549] Would quarantine: Bold Roofing - DFW'\''s Best Roofing Contractor (5deaaa853d4dbb79...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='5deaaa853d4dbb7923120aec5ce2588c8ef9f4e6c7cf0b09754d14791a8ba1c7';
COUNT=$((COUNT+1))

# 456/549: Blue Hammer Roofing
echo "  [456/549] Would quarantine: Blue Hammer Roofing (080f485ffdd248d5...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='080f485ffdd248d573146f8bf35dc622aa8c6bdc894dcf7ed96027edec11c484';
COUNT=$((COUNT+1))

# 457/549: Priority Roofing
echo "  [457/549] Would quarantine: Priority Roofing (7217051bf73e9a4c...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='7217051bf73e9a4c85141899ca8c03b70497f4fb96be42a084491b18135b6401';
COUNT=$((COUNT+1))

# 458/549: Arrington Roofing
echo "  [458/549] Would quarantine: Arrington Roofing (3572216d431829ab...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='3572216d431829ab6450e3611c527671ea399c3386007dc176945c6677cb3cfe';
COUNT=$((COUNT+1))

# 459/549: T Rock Roofing & Contracting
echo "  [459/549] Would quarantine: T Rock Roofing & Contracting (1743a8a2bb747926...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='1743a8a2bb747926280529b7a3547b7a35f95a1c6a51ae5af76fda7b3d51b2bc';
COUNT=$((COUNT+1))

# 460/549: New View Roofing
echo "  [460/549] Would quarantine: New View Roofing (08a41bca499533bb...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='08a41bca499533bb6c6ba4b6da1a98856ac8cb32456c7b6a0a984bc7eca6b233';
COUNT=$((COUNT+1))

# 461/549: Cody & Sons Plumbing, Heating & Air
echo "  [461/549] Would quarantine: Cody & Sons Plumbing, Heating & Air (a59d3dfaca375a27...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='a59d3dfaca375a270a78c081a5faf4ace9b8607761030e3f978a0113cc788f0f';
COUNT=$((COUNT+1))

# 462/549: Legacy Plumbing
echo "  [462/549] Would quarantine: Legacy Plumbing (44eebe02a2775f26...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='44eebe02a2775f26fd2814c138a57631231800fa0a9feb322f330bba5cf607ec';
COUNT=$((COUNT+1))

# 463/549: Mother Modern Plumbing, Sewer & Drain
echo "  [463/549] Would quarantine: Mother Modern Plumbing, Sewer & Drain (566ffbcc6ad0690b...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='566ffbcc6ad0690bb56179e1cf0fa72b8b5e4cada8ec31d46ea577b0e10a73c8';
COUNT=$((COUNT+1))

# 464/549: Baker Brothers Plumbing, Air & Electric
echo "  [464/549] Would quarantine: Baker Brothers Plumbing, Air & Electric (db712729c6d93285...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='db712729c6d93285e2339c6f7b6073698092a3cc4d713077cb9fa0f5deb5bedf';
COUNT=$((COUNT+1))

# 465/549: Tribeca Plumbing, Inc.
echo "  [465/549] Would quarantine: Tribeca Plumbing, Inc. (82b19a62183ee345...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='82b19a62183ee3453ca1e3a3bba3d4c1d31e9cc44986398151b8a4821f838a93';
COUNT=$((COUNT+1))

# 466/549: Metro Air Conditioning Heating & Services
echo "  [466/549] Would quarantine: Metro Air Conditioning Heating & Services (75f4d3a98445dfa7...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='75f4d3a98445dfa751ebb70099b34d2cbf443c7a53c66c9e0405e69f5ed15003';
COUNT=$((COUNT+1))

# 467/549: Astar Air Conditioning, Plumbing & Electric
echo "  [467/549] Would quarantine: Astar Air Conditioning, Plumbing & Electric (464c83a378fefd1c...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='464c83a378fefd1c08db8dbc2420249be7ff9713e4503d2326970ed7c4d8336d';
COUNT=$((COUNT+1))

# 468/549: Rescue Air and Plumbing
echo "  [468/549] Would quarantine: Rescue Air and Plumbing (2a821e1a522f98e7...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='2a821e1a522f98e7e4e1609ab28ddeb72c12fda0bce27b795b925303d37e4bef';
COUNT=$((COUNT+1))

# 469/549: Harlen Johnson HVAC, Plumbing & Electrical
echo "  [469/549] Would quarantine: Harlen Johnson HVAC, Plumbing & Electrical (ec81bcf5dac51ca2...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='ec81bcf5dac51ca2eddfc9ac5f91fa841e9b7ac00ef9a28790d854cc20ec7be4';
COUNT=$((COUNT+1))

# 470/549: Electrical Masters Company Inc.
echo "  [470/549] Would quarantine: Electrical Masters Company Inc. (d49ea9b5ea389aec...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='d49ea9b5ea389aece3312d3328ad08aa152b29470681a7d3da4f66728c2c372c';
COUNT=$((COUNT+1))

# 471/549: Right Touch Electrical
echo "  [471/549] Would quarantine: Right Touch Electrical (330ea47d04f2c05f...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='330ea47d04f2c05fb1e3b42bf4b135703ccf78c40cee726069617001724fb1b6';
COUNT=$((COUNT+1))

# 472/549: Harvest Electrical Solutions
echo "  [472/549] Would quarantine: Harvest Electrical Solutions (92bd1425cf88c709...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='92bd1425cf88c7090d0b2c6016ff48d0311f168133371e8b7630e88337e09dbb';
COUNT=$((COUNT+1))

# 473/549: Paul Richard Electric
echo "  [473/549] Would quarantine: Paul Richard Electric (cfbd82b504780018...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='cfbd82b50478001899e9ad857904defa828a1078d30cb1386443984a3672c45d';
COUNT=$((COUNT+1))

# 474/549: Rose Roofing
echo "  [474/549] Would quarantine: Rose Roofing (abb0ebf5aec05cd4...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='abb0ebf5aec05cd429d79db6362c47cfc083b9a72e9bf3f889c50da4a69cfd58';
COUNT=$((COUNT+1))

# 475/549: M&M Roofing, Siding & Windows
echo "  [475/549] Would quarantine: M&M Roofing, Siding & Windows (8b8c19c10eb55aa3...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='8b8c19c10eb55aa33fd5644b18e7ddb8c59eddba8ad90bed6f13db1d04704f41';
COUNT=$((COUNT+1))

# 476/549: Precision Roof Crafters, Inc.
echo "  [476/549] Would quarantine: Precision Roof Crafters, Inc. (365d6f1f3b190c96...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='365d6f1f3b190c9624290f16e1eb56f08d7171bbf0c71588522a3e0597894e38';
COUNT=$((COUNT+1))

# 477/549: 314 Roofing Solutions
echo "  [477/549] Would quarantine: 314 Roofing Solutions (511713efa559eb47...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='511713efa559eb472ce6034dfee31ee402e3015191ea6da52c2b3db42959254b';
COUNT=$((COUNT+1))

# 478/549: Amstill Roofing
echo "  [478/549] Would quarantine: Amstill Roofing (738a9e779264bdfa...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='738a9e779264bdfaf779e429c1e7fc651c757255d91be4ea13ee06c1b1c47fc0';
COUNT=$((COUNT+1))

# 479/549: Roto-Rooter Plumbing & Water Cleanup
echo "  [479/549] Would quarantine: Roto-Rooter Plumbing & Water Cleanup (1db061ae4b128cb5...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='1db061ae4b128cb510b0e67bb1aac402784a05fdcbb7fc3f07911d09b6ced4c6';
COUNT=$((COUNT+1))

# 480/549: 1-Tom-Plumber
echo "  [480/549] Would quarantine: 1-Tom-Plumber (5f4e02750f914f11...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='5f4e02750f914f1135fbe5588d794c6c45be9fa640cf79a791a8352ff128035e';
COUNT=$((COUNT+1))

# 481/549: All The Time Plumbing
echo "  [481/549] Would quarantine: All The Time Plumbing (875fb77b79be374b...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='875fb77b79be374b542989c56490e6d726f879c6e0a782c0d81cc10ed0514aef';
COUNT=$((COUNT+1))

# 482/549: All Around Plumbing LLC
echo "  [482/549] Would quarantine: All Around Plumbing LLC (c625675318c58380...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='c625675318c58380d581b63438c8215104a706866fe67aba73d6469a4363a794';
COUNT=$((COUNT+1))

# 483/549: Nick'\''s Plumbing & Air Conditioning
echo "  [483/549] Would quarantine: Nick'\''s Plumbing & Air Conditioning (29d99cec17c4de32...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='29d99cec17c4de322e6dbbd50ab1a13998ce210eca62a65e85cb0b3c9465b298';
COUNT=$((COUNT+1))

# 484/549: Village Plumbing, Air & Electric
echo "  [484/549] Would quarantine: Village Plumbing, Air & Electric (827a95f81f0a5ff3...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='827a95f81f0a5ff35ec0b7099a1f107c8d6a49fbeb18781d066d683d6e09aa26';
COUNT=$((COUNT+1))

# 485/549: Air Tech of Humble - Elite Comfort
echo "  [485/549] Would quarantine: Air Tech of Humble - Elite Comfort (d45178feda8aed19...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='d45178feda8aed193831024e110f68ac1ff3f4994f0757e24776d81c3d7e7a7b';
COUNT=$((COUNT+1))

# 486/549: Excel Air
echo "  [486/549] Would quarantine: Excel Air (d9f7251058a2a779...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='d9f7251058a2a779c3bbf8ffd059e106596602adf2aa6f9d2c551e4870d7c93a';
COUNT=$((COUNT+1))

# 487/549: The Lee Thompson Co
echo "  [487/549] Would quarantine: The Lee Thompson Co (31123d948994cfef...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='31123d948994cfef26d618c30c6651da6404596b71e17649370633cf844c3b9b';
COUNT=$((COUNT+1))

# 488/549: EZ Comfort Air Conditioning & Heating
echo "  [488/549] Would quarantine: EZ Comfort Air Conditioning & Heating (4c3ca1e857a324f6...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='4c3ca1e857a324f616f02d18dd69eedcfef265d9a425db1d60e28bdc0494d9d9';
COUNT=$((COUNT+1))

# 489/549: Bellaire Air Conditioning
echo "  [489/549] Would quarantine: Bellaire Air Conditioning (083134687550c889...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='083134687550c88904596591a3e3a90eade803faea790758dd99a7dbdddb6444';
COUNT=$((COUNT+1))

# 490/549: Mission Air Conditioning & Plumbing
echo "  [490/549] Would quarantine: Mission Air Conditioning & Plumbing (f4d36a7bd49cd773...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='f4d36a7bd49cd773bbc61c54822af2eaca10736b5d1a7f74cfde95a8ee817868';
COUNT=$((COUNT+1))

# 491/549: Mirsky Electric
echo "  [491/549] Would quarantine: Mirsky Electric (07d87e721c9bc176...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='07d87e721c9bc176c0124e6be9d19f97ada8616791cbfbf5499bf7119e597e15';
COUNT=$((COUNT+1))

# 492/549: Electric Company of Seattle
echo "  [492/549] Would quarantine: Electric Company of Seattle (28282e2c7e97ca93...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='28282e2c7e97ca93a3c6c57586964cff150b2e6f4452ec8987733f85e8c6a59a';
COUNT=$((COUNT+1))

# 493/549: Exact Electric
echo "  [493/549] Would quarantine: Exact Electric (70cc876aaa787132...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='70cc876aaa787132a79620e0165166dde90d2933dc1cd7a8ad75f6e69fe54697';
COUNT=$((COUNT+1))

# 494/549: Best Plumbing
echo "  [494/549] Would quarantine: Best Plumbing (bbf234a79d0d0da5...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='bbf234a79d0d0da5f73997ddcadd1903ed2bd0ce45a65a59a7c4f0ceb3f57d38';
COUNT=$((COUNT+1))

# 495/549: Gene Johnson Plumbing
echo "  [495/549] Would quarantine: Gene Johnson Plumbing (c29568505628237e...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='c29568505628237e14800508f4b091e32ec66272e7b0b8014c1e008e55b48187';
COUNT=$((COUNT+1))

# 496/549: Carter'\''s My Plumber - Plumbers Indianapolis, Water Heater Repair
echo "  [496/549] Would quarantine: Carter'\''s My Plumber - Plumbers Indianapolis, Water Heater Repair (b18b943fee7ebb47...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='b18b943fee7ebb475c19886475e1ccb5939ad1e378717dfc3d611dd5b00ffeab';
COUNT=$((COUNT+1))

# 497/549: Charlotte Roofing Specialists
echo "  [497/549] Would quarantine: Charlotte Roofing Specialists (004c9c8d9e5205f2...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='004c9c8d9e5205f2131ac84e1ab2dd622cd801c17d59e3407a4645167f2af374';
COUNT=$((COUNT+1))

# 498/549: Mr. Electric of South Charlotte
echo "  [498/549] Would quarantine: Mr. Electric of South Charlotte (7fc2f9b85b40c561...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='7fc2f9b85b40c5610e044404a7e821ec69349371ee4f3574e511391c0e56434c';
COUNT=$((COUNT+1))

# 499/549: Mister Sparky
echo "  [499/549] Would quarantine: Mister Sparky (567d190eb3dfe6ee...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='567d190eb3dfe6eebb7c71f4cedc529c673ba961b552ec720fd956775ca4d122';
COUNT=$((COUNT+1))

# 500/549: Swift Brothers Plumbing, Heating & Air
echo "  [500/549] Would quarantine: Swift Brothers Plumbing, Heating & Air (98e177a386957820...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='98e177a3869578207541ab0438fd26a420406fa9ad00813ae6995fe64e175d42';
COUNT=$((COUNT+1))

# 501/549: The Local Plumber LLC
echo "  [501/549] Would quarantine: The Local Plumber LLC (68b120074aba031c...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='68b120074aba031c11747392e3eaec7ac8b0975646bbd35e0bf887c4e35b55ca';
COUNT=$((COUNT+1))

# 502/549: 1-Tom-Plumber
echo "  [502/549] Would quarantine: 1-Tom-Plumber (838277979c24c9cc...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='838277979c24c9cc782d1f1bc67da01f11259aa323b6730a0430703d4d2096df';
COUNT=$((COUNT+1))

# 503/549: Parson Plumbing and Drains
echo "  [503/549] Would quarantine: Parson Plumbing and Drains (13c9bf84183884e6...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='13c9bf84183884e60a822e32a2c4dbc9eada35701de3f73787b7f389ddf662f3';
COUNT=$((COUNT+1))

# 504/549: SPE Electrical Services
echo "  [504/549] Would quarantine: SPE Electrical Services (503d03688de4a551...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='503d03688de4a55118b0a7818b45a43fd894e274db1d242459f2430cf365ea0f';
COUNT=$((COUNT+1))

# 505/549: Volt Vikings
echo "  [505/549] Would quarantine: Volt Vikings (c4dc5fb2e1cc9de6...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='c4dc5fb2e1cc9de61d7e0c2a265a55d4bd76d55d3d594beafc8ca0c79958fba4';
COUNT=$((COUNT+1))

# 506/549: Sears Heating and Cooling
echo "  [506/549] Would quarantine: Sears Heating and Cooling (7a3aa613d1f6d287...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='7a3aa613d1f6d287fe00c0ca70cbb915ef16b365aff668bf4497253670f883b7';
COUNT=$((COUNT+1))

# 507/549: Ace Comfort Air Conditioning & Heating
echo "  [507/549] Would quarantine: Ace Comfort Air Conditioning & Heating (418cdc8ee4aa1a6e...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='418cdc8ee4aa1a6e6941a14334591b7396cbbbccc38cdc6ae6117148035bf1e4';
COUNT=$((COUNT+1))

# 508/549: All Star A/C, Plumbing & Electrical
echo "  [508/549] Would quarantine: All Star A/C, Plumbing & Electrical (3587b35015f4d229...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='3587b35015f4d22919b474e06c1e600ab71f014a6f61753c7e1e9d33157f798a';
COUNT=$((COUNT+1))

# 509/549: Air Tech of Houston AC & Plumbing
echo "  [509/549] Would quarantine: Air Tech of Houston AC & Plumbing (b558f652ad61b5da...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='b558f652ad61b5da7aa40d83619f612206d82d8c6c18d8ab58718909a1718802';
COUNT=$((COUNT+1))

# 510/549: Chicago Roofing Company
echo "  [510/549] Would quarantine: Chicago Roofing Company (792cca27faaa6c06...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='792cca27faaa6c06d3f9d9f313ef49a94439f29d5906348c5cb50826c0efe302';
COUNT=$((COUNT+1))

# 511/549: Chicago Prestige Roofing
echo "  [511/549] Would quarantine: Chicago Prestige Roofing (9ee932141f6ee15a...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='9ee932141f6ee15a9fa7ffbfcfc389beb9684c8c444b1787d0063f9daa68b16b';
COUNT=$((COUNT+1))

# 512/549: Chicago Roofing Solutions
echo "  [512/549] Would quarantine: Chicago Roofing Solutions (945065763f597f31...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='945065763f597f312ffbc505c466619c1b9e319240943af8dee2c35e301b58da';
COUNT=$((COUNT+1))

# 513/549: Roofing By Hernandez Inc
echo "  [513/549] Would quarantine: Roofing By Hernandez Inc (62b517f614fea723...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='62b517f614fea72317c7cdbe40c3fda52853f73462859a0246284bcd583829b3';
COUNT=$((COUNT+1))

# 514/549: Chicago Flat Roofing Contractors | Residential & Commercial Roofing Repairs
echo "  [514/549] Would quarantine: Chicago Flat Roofing Contractors | Residential & Commercial Roofing Repairs (55c888f4aa52cd96...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='55c888f4aa52cd9694109b0bc270afc8be7c39141775ec26e42b707741b7960f';
COUNT=$((COUNT+1))

# 515/549: SAFE Electrical Service
echo "  [515/549] Would quarantine: SAFE Electrical Service (8a389518b3b5b4ec...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='8a389518b3b5b4ecbccba857d9a719a10f4d65c4614beaeef808498c200090d9';
COUNT=$((COUNT+1))

# 516/549: Sims & Sons Electric and Plumbing
echo "  [516/549] Would quarantine: Sims & Sons Electric and Plumbing (0d2c8fdb159c6f56...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='0d2c8fdb159c6f569b895d2f8ab3e41bbb52cc422d83aba06da47a70d5ba921b';
COUNT=$((COUNT+1))

# 517/549: Chicago Heating & Cooling
echo "  [517/549] Would quarantine: Chicago Heating & Cooling (641446a391f68eef...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='641446a391f68eef966aaa43b06a687f0c517938a46488fd723db0dc046f9203';
COUNT=$((COUNT+1))

# 518/549: Roland Slate Service Co., Inc.
echo "  [518/549] Would quarantine: Roland Slate Service Co., Inc. (cb967c535861215d...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='cb967c535861215d7170d2081ab91c3f8b201b6d3366e7041db2e91303f0689a';
COUNT=$((COUNT+1))

# 519/549: Charm City Roofing
echo "  [519/549] Would quarantine: Charm City Roofing (63a0416b876d7152...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='63a0416b876d7152158d518315bf99a1f1ce8fbb77057f300cbeca625a59399c';
COUNT=$((COUNT+1))

# 520/549: Four Twelve Roofing
echo "  [520/549] Would quarantine: Four Twelve Roofing (dcde8ebaae6d599e...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='dcde8ebaae6d599e4bd9e2cb44da43b37fd17217348563d107dfc98bf42904c8';
COUNT=$((COUNT+1))

# 521/549: Clinton Electric Company
echo "  [521/549] Would quarantine: Clinton Electric Company (bca6b806243ca7ec...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='bca6b806243ca7ecdca7cceffd74f5fb144588603c04571ed25e83cc10d4b135';
COUNT=$((COUNT+1))

# 522/549: Dynamo Electric, LLC
echo "  [522/549] Would quarantine: Dynamo Electric, LLC (a205096ad52da76e...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='a205096ad52da76e18f120aed6dc8295e77ab557bd7c1f66c84447093d2b5a3d';
COUNT=$((COUNT+1))

# 523/549: Rpm Electrical Company ⚡️💡🔌 💡
echo "  [523/549] Would quarantine: Rpm Electrical Company ⚡️💡🔌 💡 (dd7e668d1030eb6a...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='dd7e668d1030eb6a99fd54786cc88e63c4fd24a7a4d43f9e4f6ade53a606fca0';
COUNT=$((COUNT+1))

# 524/549: Common Ground Electrical
echo "  [524/549] Would quarantine: Common Ground Electrical (622ecb1a13c15422...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='622ecb1a13c1542262cd5b3427821b5ae78204808e58c1536c3c7703576f76e2';
COUNT=$((COUNT+1))

# 525/549: CK'\''s Plumbing & Backflow, LLC
echo "  [525/549] Would quarantine: CK'\''s Plumbing & Backflow, LLC (8bd5d8432757fe19...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='8bd5d8432757fe19b108a574bac4b0d0bc5d94a39c508d47536888c24d0fac20';
COUNT=$((COUNT+1))

# 526/549: Matthew'\''s Plumbing Solutions
echo "  [526/549] Would quarantine: Matthew'\''s Plumbing Solutions (1885b6bf31ab490a...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='1885b6bf31ab490a5d3e54a5cc14ad6309d13ae6d1ba513dee2148de35648575';
COUNT=$((COUNT+1))

# 527/549: William Parrish Plumbing
echo "  [527/549] Would quarantine: William Parrish Plumbing (4b141af108a98e88...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='4b141af108a98e88be242b1f1ae6d183a1d717caceb3c58aa6717e0af2c872ed';
COUNT=$((COUNT+1))

# 528/549: Thermo Direct, Inc.
echo "  [528/549] Would quarantine: Thermo Direct, Inc. (3ee6c772764cceda...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='3ee6c772764cceda42c46b4883e5450c312d609e42569528c91290e9d8288a14';
COUNT=$((COUNT+1))

# 529/549: Comfort Monster Heating & Air
echo "  [529/549] Would quarantine: Comfort Monster Heating & Air (6f7899faa084e520...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='6f7899faa084e520206bb6cd0180df845fe3f10450f6c5c8d87f792b9c715804';
COUNT=$((COUNT+1))

# 530/549: P D Roofing
echo "  [530/549] Would quarantine: P D Roofing (d5929dc398dc2331...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='d5929dc398dc2331bc88aa7c04257d25e3cef3e95840e3b13b9dd95baaa56251';
COUNT=$((COUNT+1))

# 531/549: Detroit Roofing Service
echo "  [531/549] Would quarantine: Detroit Roofing Service (199f3064638fdfac...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='199f3064638fdfacade4580e3c55d1ec569be734ed56533864c8ffd6807e2424';
COUNT=$((COUNT+1))

# 532/549: Detroit Speedy Electrician
echo "  [532/549] Would quarantine: Detroit Speedy Electrician (54997035855415b6...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='54997035855415b6d11015325903f8af638afce0f1c0c05ce22f633113d29661';
COUNT=$((COUNT+1))

# 533/549: Detroit Plumbing and Drain Services
echo "  [533/549] Would quarantine: Detroit Plumbing and Drain Services (71cd84763652ffdc...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='71cd84763652ffdc7e0ec891cfa3d050111fb363d1830d55f32b46c73f35e5c3';
COUNT=$((COUNT+1))

# 534/549: A&H HVAC SERVICES
echo "  [534/549] Would quarantine: A&H HVAC SERVICES (20d6713dd728eaf0...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='20d6713dd728eaf0da3ba7f0fd2865679a06aa3d35163cbeebebc566ffd95d4d';
COUNT=$((COUNT+1))

# 535/549: Manning Mechanical
echo "  [535/549] Would quarantine: Manning Mechanical (5eab0ebaa20f1946...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='5eab0ebaa20f1946c3b1decd9d06c5f72bcc89b7b70f5e1f572426f83369d4ad';
COUNT=$((COUNT+1))

# 536/549: IBEX Roof
echo "  [536/549] Would quarantine: IBEX Roof (44e1a488b2fc3aaf...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='44e1a488b2fc3aaf2d5c94eb4c76dda4e41143fdce46d9f26aba544379389e53';
COUNT=$((COUNT+1))

# 537/549: Flow Roofing
echo "  [537/549] Would quarantine: Flow Roofing (14720b72293587c3...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='14720b72293587c3b9221ef627558ccb55e6535cdeb2c8ec1e00443dde40c1af';
COUNT=$((COUNT+1))

# 538/549: Portland Roofing Company LLC
echo "  [538/549] Would quarantine: Portland Roofing Company LLC (55327f1b102f3d4e...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='55327f1b102f3d4e0ed8ff597e1373f645538389bed26af390b3fdf2b105cac3';
COUNT=$((COUNT+1))

# 539/549: Falcon Electric
echo "  [539/549] Would quarantine: Falcon Electric (a2a00318f3496f84...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='a2a00318f3496f84603e0537d6a9073104cf42082ee8769ea95bbd169e350046';
COUNT=$((COUNT+1))

# 540/549: Young Electric LLC
echo "  [540/549] Would quarantine: Young Electric LLC (5aaf26b92819db45...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='5aaf26b92819db45b39d9f0e019a585a4a7df7d9cf477106e9c2ddde67136ea5';
COUNT=$((COUNT+1))

# 541/549: Lovett Inc.
echo "  [541/549] Would quarantine: Lovett Inc. (a6788c58d0913e7c...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='a6788c58d0913e7c83f39164f7fe8d0c8cba3ea65413f0420392cec5d4e07623';
COUNT=$((COUNT+1))

# 542/549: Crown Plumbing
echo "  [542/549] Would quarantine: Crown Plumbing (d074e190256eaa0e...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='d074e190256eaa0ea7a3c90bc48ebab8e888a1dbbb1a89fb5c6d516a52886c7c';
COUNT=$((COUNT+1))

# 543/549: Sun Glow Inc. Portland
echo "  [543/549] Would quarantine: Sun Glow Inc. Portland (a14b6b4c0d2dc5f1...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='a14b6b4c0d2dc5f14c3747f109fdba79e76c32ccf7fc8e254207bbdec8dc0162';
COUNT=$((COUNT+1))

# 544/549: Pyramid Heating & Cooling
echo "  [544/549] Would quarantine: Pyramid Heating & Cooling (d6227e6c5a40d89a...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='d6227e6c5a40d89accac114cc608bbadbf7bc79a7b42f9194d6661cd1a642aeb';
COUNT=$((COUNT+1))

# 545/549: Rainier Roofing Company
echo "  [545/549] Would quarantine: Rainier Roofing Company (2a8d0e0c56389b1f...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='2a8d0e0c56389b1f74943634514d57608c12d0d9d3b5e94b1da402dae41e6f78';
COUNT=$((COUNT+1))

# 546/549: The Seattle Roofing Company
echo "  [546/549] Would quarantine: The Seattle Roofing Company (ac61a2b9c9772e0c...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='ac61a2b9c9772e0c8fed62ebfcd8419fa28953679b57e360d575611ddd409c9e';
COUNT=$((COUNT+1))

# 547/549: As You Wish Electric, Plumbing, Heating & Air
echo "  [547/549] Would quarantine: As You Wish Electric, Plumbing, Heating & Air (ca265d9369234f7f...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='ca265d9369234f7fd16b2140ba1a3c15182eaf12bb4b463300e4dadd73b9f312';
COUNT=$((COUNT+1))

# 548/549: Seattle Electrician
echo "  [548/549] Would quarantine: Seattle Electrician (46eeb32d12662083...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='46eeb32d126620837dc8771d3742757513467485e1930bb4bb5cef53dad94772';
COUNT=$((COUNT+1))

# 549/549: South West Plumbing, Heating, Air, & Electric
echo "  [549/549] Would quarantine: South West Plumbing, Heating, Air, & Electric (ca6f1331b49a5396...)"
# SQL: UPDATE leads_pool SET source='quarantine_unapproved', notes='QUARANTINED:2026-08-01|unapproved_broad_source' WHERE lead_id='ca6f1331b49a53965c2b32ebb039f310e7e3ee6245a5603aa990bdd4a55deaff';
COUNT=$((COUNT+1))

echo "Quarantine plan complete. Review and run via Turso CLI."
echo "Total flagged: $COUNT records (no mutations performed by this script)."
