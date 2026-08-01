#!/bin/bash
# ═══════════════════════════════════════════════════════════
# QUARANTINE REVERT — Restores quarantined records
# Run after quarantine_cleanup.sh if needed.
# ═══════════════════════════════════════════════════════════
if [ "$1" != "--approve" ]; then
  echo "ERROR: Requires --approve flag."
  exit 1
fi

TOTAL=549
COUNT=0

echo "  [1/549] Would restore: Fuse HVAC, Refrigeration, Electrical & Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='1e5aa889f0b747331076eff852d4ad2c86ce4714151d17830d729884ed86dae1';
COUNT=$((COUNT+1))

echo "  [2/549] Would restore: Energize NYC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='2dbe6d607a5094e32779199c98c71001ff198779f0e909b74e0984fc56555753';
COUNT=$((COUNT+1))

echo "  [3/549] Would restore: Electrician Techs"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='970b8ca1905e133bb1e9e7769812c40605bfc4a1e6bb5211123495e7af22f0a7';
COUNT=$((COUNT+1))

echo "  [4/549] Would restore: Top HVAC NYC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='0642e038c83a6c8c6f9bdf370e6c9c74cd35a444ed70acde6e74016d05192b68';
COUNT=$((COUNT+1))

echo "  [5/549] Would restore: Electric City"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='c23ff19aaee1059c8dea0439320ebbb5d6c365e778d92e90fe392a65259c8d82';
COUNT=$((COUNT+1))

echo "  [6/549] Would restore: Elite Power Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='6e045c961e499ba9e8bbbb381b8b4d80dd03e5856003a0df4a0ce7852108e42c';
COUNT=$((COUNT+1))

echo "  [7/549] Would restore: Electric Lee"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='d6c4ff09df64a7f32256a1954a40a954f817aed8b501ff0d75a2d05bdccfeef2';
COUNT=$((COUNT+1))

echo "  [8/549] Would restore: The Electric Connection"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='48113b5d9580ffc28bbceb89e442765d1118b82818080c196320c46cd1b9e55b';
COUNT=$((COUNT+1))

echo "  [9/549] Would restore: Arizona'\''s Finest Electrical Services"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='b33c963409e26247a6098355d2355c343b0318e56a7fa8783d575eff24c76d81';
COUNT=$((COUNT+1))

echo "  [10/549] Would restore: P&L Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='243757bb2301e3a97b555f253be400f99a8b523b8ffcb562e68aa100ea13784e';
COUNT=$((COUNT+1))

echo "  [11/549] Would restore: Transcend Electrical Services LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='54f6afc2d5f2d9a152abe9b2d71bdcac6a16793477df7652af09b594e5bed773';
COUNT=$((COUNT+1))

echo "  [12/549] Would restore: O'\''Brien Electric LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='f592ec7e75594b12904a98d0042f815e2215b4873860a4b9cedb1d24a29e6e91';
COUNT=$((COUNT+1))

echo "  [13/549] Would restore: CJM Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='26486fd87e342a91b79a44919a8ce9ab9c9f31592927f45b40e5a25997424160';
COUNT=$((COUNT+1))

echo "  [14/549] Would restore: Rapid Rooter Drain Master & Plumbing Experts"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='5ef69da4185deeec3d191a4483c37130f81ff54e1bce7d4111675cb19deb09e3';
COUNT=$((COUNT+1))

echo "  [15/549] Would restore: Sunny Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='d8b5c4b8bdfd0d0d34991e1d1d8f9229b7656d2a4f8c3d2cc9b7d809e5ba8c7a';
COUNT=$((COUNT+1))

echo "  [16/549] Would restore: Buddy Heilig & Sons Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='ade822b9f0db8c70581c044e03ebb74a2f9e6eee3c3ffd17463a25b2f05025e0';
COUNT=$((COUNT+1))

echo "  [17/549] Would restore: Add On Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='af26f6d0912d6101c614ceb84d77c837e85f52b44a39e37d592309f822f0525b';
COUNT=$((COUNT+1))

echo "  [18/549] Would restore: Motherroad Plumbing Heating & Cooling"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='996379f644d6d7750da6fe4f058c5737b52697e0b8f45d5c1429c82b8a550064';
COUNT=$((COUNT+1))

echo "  [19/549] Would restore: MONOPOLIZE MILWAUKEE PLUMBING"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='9d0921c4ca3352478342921bcd4a1714da94ef0377b8a83565ebb4b88b770f0d';
COUNT=$((COUNT+1))

echo "  [20/549] Would restore: Caliber Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='7f008cc8ded392df4fddf278c782a26347c3169ce7b2a738ba4661191e451cbd';
COUNT=$((COUNT+1))

echo "  [21/549] Would restore: Blau Sudden Service"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='35a440e987a3bce60842a6217ab5a43d271e33fc45421571f6997bab941eed94';
COUNT=$((COUNT+1))

echo "  [22/549] Would restore: SJT Plumbing & HVAC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='8258984bd1bd8ee44c8e1c93f66cfc31e5acb3ea403caf8fd716765469d0d2a9';
COUNT=$((COUNT+1))

echo "  [23/549] Would restore: T&T Electrical Services"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='8da67b0f45c3e770c75ccc9a705a8368a7e58e665d7963d11c6153756aaee390';
COUNT=$((COUNT+1))

echo "  [24/549] Would restore: Impel Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='6a5e1c9c384c5a3cbabb801b85acce9ff355600b7116bc20123e28b47e32f03a';
COUNT=$((COUNT+1))

echo "  [25/549] Would restore: Treehouse"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='126eaa024d9e4edc950a1c232bd43f4e8eeacfb7ceb960b46ed0cba8e8829394';
COUNT=$((COUNT+1))

echo "  [26/549] Would restore: Pointe Roofing Pros"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='1fda298401947f4f1cbb40cca16a77edd4bcb98adef650759842425caead58a4';
COUNT=$((COUNT+1))

echo "  [27/549] Would restore: Sky Heating and Cooling LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='f11e6d2cd70dea73a5722e8bab16aacbdd9c7b09fc7f7f862a5b2a1450c70d10';
COUNT=$((COUNT+1))

echo "  [28/549] Would restore: Blue Moon Electrical"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='6869e005ed87904b64756f8d34fbe8e53ecf6140d16650ae2d137ea46940ed0b';
COUNT=$((COUNT+1))

echo "  [29/549] Would restore: Fuse Service"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='c8e7153761488caaefa0c15a93671601ca80aa9953c7ff28c394dfff7493fe45';
COUNT=$((COUNT+1))

echo "  [30/549] Would restore: Elite Rooter"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='651a09d686abaa4856816d740715d0d1ad6906bfcf3bd194b9a97f4f9d312e02';
COUNT=$((COUNT+1))

echo "  [31/549] Would restore: Bueno Plumbing and Rooter"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='32f448e536dbf462ca94f1437b4a6b9c98ae7baa9224f7d87ded22f41478c686';
COUNT=$((COUNT+1))

echo "  [32/549] Would restore: Allstar Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='f8ad9cc362fea4c37b47e6be22337af3ee3d265020b5a1199e01e008972b7a6d';
COUNT=$((COUNT+1))

echo "  [33/549] Would restore: Plumbtree Plumbing & Rooter"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='34cc2c13dd1477002acb25fde30c7cdfa99997eab55d409dc7101a41121ad500';
COUNT=$((COUNT+1))

echo "  [34/549] Would restore: Crown Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='469a19999c94fcd55517d8a16e537faf2efdff078818e076758bba6c034bc2a1';
COUNT=$((COUNT+1))

echo "  [35/549] Would restore: Golden Comfort AC & Heating Repair"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='50aa0fdf57e3f274269e2ac2a795e8de084c2f6b92450eebdce0e85bc01dca01';
COUNT=$((COUNT+1))

echo "  [36/549] Would restore: DG Heating and Air Conditioning"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='101e1165d13c03be0971d29150648fdbaedd355087b05f0728e5c9efd44ee502';
COUNT=$((COUNT+1))

echo "  [37/549] Would restore: Sandium Heating and Air Conditioning"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='e8fe20b64b6070548d31ad3a1e2b455edaa1856ac879cd9f6ddba8341597f59d';
COUNT=$((COUNT+1))

echo "  [38/549] Would restore: Air Care Heating & Cooling Inc."
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='1ddff449f8b8a4e9a31fe50272e30fc6773cda59813a8569da052fa55a58bd32';
COUNT=$((COUNT+1))

echo "  [39/549] Would restore: IRBIS HVAC Inc"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='fbe700f7d14983ae19f431ad200d821c1b12d98047883b44ac84551200ebb33b';
COUNT=$((COUNT+1))

echo "  [40/549] Would restore: Plumbing Services of Raleigh"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='46d5dedb7246da0edbfe46f97ede182b555554595d35b80cf180766e0e1d0eb6';
COUNT=$((COUNT+1))

echo "  [41/549] Would restore: Rinder Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='9f6c06e82f0af8e7007d3e9ea4a364ad2fb61fd9a7fea47a6c067c349f7a05d6';
COUNT=$((COUNT+1))

echo "  [42/549] Would restore: Shorty'\''s Plumbing LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='a10ad988281bf7b650f909d45f6d28041888b229aeaaf855ee70e93221b347fd';
COUNT=$((COUNT+1))

echo "  [43/549] Would restore: Pro Electric L.C."
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='72318ab0e33b3b1d93196280a9c18a543142142ff2a8be9d5a89ee97522f4e0c';
COUNT=$((COUNT+1))

echo "  [44/549] Would restore: Fusion Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='04f20aa08aae75e70c0f8ea2789c8ddb7eee39f367a3bf70a8006b9104e62e2a';
COUNT=$((COUNT+1))

echo "  [45/549] Would restore: Jeremy Electrical"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='ed0eff47892721e24abbf18c65e1ec375f46276ef5882fe376abbd80fed5a10d';
COUNT=$((COUNT+1))

echo "  [46/549] Would restore: Scott The Electrician"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='fb0767f92aee508b324c13a50a32a56422a8c604246dd08d8db75248e965cebb';
COUNT=$((COUNT+1))

echo "  [47/549] Would restore: Current Solutions Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='7c0f41a486866004478ce683b89eb94f4d742ec52babc054ef25fb861e2e99c6';
COUNT=$((COUNT+1))

echo "  [48/549] Would restore: JR & Co."
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='a67eb371978372c770385bd38edf2e4ae6bfbb4fc18d1f100a29da2856041984';
COUNT=$((COUNT+1))

echo "  [49/549] Would restore: Murphy & Sons Roofing, Inc"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='75182d26f39972bfef9620f641ee8a3f14b1b70c7777ae4aa470e55577c0cfd2';
COUNT=$((COUNT+1))

echo "  [50/549] Would restore: Century Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='6a29770f7deccc962d99ff768b67434a0cabeca1059a1cf8bb6701900ad0146e';
COUNT=$((COUNT+1))

echo "  [51/549] Would restore: Easton Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='c973d965d40a1b586b76dbd5322292329610228084637a60f306222d026b9b62';
COUNT=$((COUNT+1))

echo "  [52/549] Would restore: Poor John'\''s Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='91a1a0f5a052c5b895a256eac4fc9c9eab4ab1603cfa04a723052abde408b9f9';
COUNT=$((COUNT+1))

echo "  [53/549] Would restore: Quick Relief Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='aaec178a3df6505fa4e0ab0f27d863eb495291aefb12f7172c70320742c3b912';
COUNT=$((COUNT+1))

echo "  [54/549] Would restore: Quality Plumbing Inc"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='cf61d3f46ce77be2a30dc02e89dc76f8073206d45884927918fae3abe6795930';
COUNT=$((COUNT+1))

echo "  [55/549] Would restore: Better Service Heating, Cooling, and Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='41a0abc9b963e9f6f5ef1c853c2291fa430888369de3e5012d81efbcc6979525';
COUNT=$((COUNT+1))

echo "  [56/549] Would restore: Premier Comfort Heating & Cooling"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='b4725e86dd91c304c0cb206f5aaad36b0c08d024158e292da09de9dc7f41f739';
COUNT=$((COUNT+1))

echo "  [57/549] Would restore: A.B. May Heating, A/C, Plumbing & Electrical"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='81917a66ef0649eab5de4a6c11e21c631cdb7fa71d2c35431eb7f0178651e358';
COUNT=$((COUNT+1))

echo "  [58/549] Would restore: Florida Electrical Services & Contracting"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='2759775cab1eedffe3b593d4af000294a02a9f1be4ef34a0dcb7ae2b69335e6b';
COUNT=$((COUNT+1))

echo "  [59/549] Would restore: Clear Comfort Air Conditioning & Heating – Orlando"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='c663627ee896098a909d006054ae375684f39c9137fc22eaf733b976900e7685';
COUNT=$((COUNT+1))

echo "  [60/549] Would restore: Ark & Anchor Electrical, LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='afc817b3edc52e7da2d49d54118e4c5325d73ba578ac3d2c9a5bd53cb67a24a4';
COUNT=$((COUNT+1))

echo "  [61/549] Would restore: Honesty Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='d8f758052e69ada98222de8e64a317a77713221aecede0b19f399d26d0c06ba1';
COUNT=$((COUNT+1))

echo "  [62/549] Would restore: Charlotte'\''s Best Roofing And Gutters"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='d32d26db23b5d28b097a322eea8b01fd71208315e9e7733569b3dd653e3810e9';
COUNT=$((COUNT+1))

echo "  [63/549] Would restore: Signature Exteriors"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='547311559d41db32c007be970c0c1d3551683bd76dae9f2b62eb093a2e2e0dfe';
COUNT=$((COUNT+1))

echo "  [64/549] Would restore: Electricode"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='a426ce24e216476efb90ec22731a155e151884f2eb25345b65423b90191fb95a';
COUNT=$((COUNT+1))

echo "  [65/549] Would restore: Penny Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='99c3b2b2a08de57e4bd7f18ce1509ef30ce36429147f584f4058d1ea983e1070';
COUNT=$((COUNT+1))

echo "  [66/549] Would restore: Discount Roofing NV LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='f19fae6c37fa342db908396dd492a24477322865579c4e1ff9b1eeab22c97939';
COUNT=$((COUNT+1))

echo "  [67/549] Would restore: Disalvo Roofing LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='5d50defbe31e9f2071d77abe4a8c3fd209b80bb65085cba280185934d0fad543';
COUNT=$((COUNT+1))

echo "  [68/549] Would restore: Impact Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='1d17bf712a8813197ef1f1af266ba017ac6f7c306875509555b0acaab831b4f2';
COUNT=$((COUNT+1))

echo "  [69/549] Would restore: Simply Cooling Heating & Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='406ef043ed19ad5c318ca5206bbb3b5570d76b30930438a8d4d42da1711bae09';
COUNT=$((COUNT+1))

echo "  [70/549] Would restore: Fast Affordable Air"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='bcf90ab16b011cb402348774f0341568d70d61d6ec6fc8402b5e61de64d0f9a9';
COUNT=$((COUNT+1))

echo "  [71/549] Would restore: Electrical Contractors of Georgia"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='61bcff6d4f858a4d00946d3ad1026d72c71fc419d3bbe239b48e9a965236f1a6';
COUNT=$((COUNT+1))

echo "  [72/549] Would restore: Morningside Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='2372027652e668121cde963ac8fcac9ebbd2349c20d5e33ac1a24e2ff3505852';
COUNT=$((COUNT+1))

echo "  [73/549] Would restore: PWR PRO ELECTRIC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='eb25d756f32b873197af3bb6e55fdee46d3cfcc3c6d0c3ea52a989430f73f80f';
COUNT=$((COUNT+1))

echo "  [74/549] Would restore: Alki Electric LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='2bc67c41aa2d8d16173610c48a31094c665fbbc1d133bfca677bdd62a7d7a2bd';
COUNT=$((COUNT+1))

echo "  [75/549] Would restore: Peach Tree Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='cbbc3121eae0fe69cfca1212775307d2577911ca9bc9ffe931b93ead078150a6';
COUNT=$((COUNT+1))

echo "  [76/549] Would restore: Miami Electric Masters"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='cff79d9de31cdbcb199fd0eb8d4aaa8342a4020ce694242000a7e72dc8e97229';
COUNT=$((COUNT+1))

echo "  [77/549] Would restore: Mr. Clog Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='3b8a31bded53b4aaed74fe1b9cd22e3575e20eb7f29c93b9b76ec4a675fb3997';
COUNT=$((COUNT+1))

echo "  [78/549] Would restore: Apollo Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='33462e098451797c1ab8ca599ac8680a9db869bd65bc2839c18777d475804170';
COUNT=$((COUNT+1))

echo "  [79/549] Would restore: H&A Electrician"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='42c64a4b10c4d2aa5b94340cd9d7ffe8d7c040cb9bc6a9a8245d0b82984615fb';
COUNT=$((COUNT+1))

echo "  [80/549] Would restore: Electrician NYC LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='df72a23a873ee17ac5fc903f8e51a9ddb5a6439c046ff49ca2297fd6fc238471';
COUNT=$((COUNT+1))

echo "  [81/549] Would restore: Manhattan Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='35ef205985a16812ceb261e1594b4177a1804c0d7bccc80923cc0685a852340a';
COUNT=$((COUNT+1))

echo "  [82/549] Would restore: City Roofing Company NYC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='6e34c7c582743c59f6e869c7484568201534fdf7ce211b0ba2e6cfef82430574';
COUNT=$((COUNT+1))

echo "  [83/549] Would restore: Mr. Plumber"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='5b54179b78238f9d045945b0da5cb633a888201e57eac96a38c7ce9d23144da8';
COUNT=$((COUNT+1))

echo "  [84/549] Would restore: Pemati Plumbing Services LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='9f65d84c8100c75dae0292be9a8f30e4aceee9e3851413bea8ec7ff1bdd0be00';
COUNT=$((COUNT+1))

echo "  [85/549] Would restore: 24 Hr. Emergency Plumbing & Hot Water Heater"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='cb20afcb22bce4bd1480d82a7c69f1324b744f64f93548a1ee971573b6021dc5';
COUNT=$((COUNT+1))

echo "  [86/549] Would restore: Rite Plumbing & Heating Inc"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='5f841292a1b478583abe14e5dea8b2dadfd35d9bea6c4b7b477e87b5c97f9705';
COUNT=$((COUNT+1))

echo "  [87/549] Would restore: A&E NYC Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='501d73e5837a5bdcc34b39fc1984f571f7ca289aae7d8e2bbd6f20bd58daaa77';
COUNT=$((COUNT+1))

echo "  [88/549] Would restore: Plumbing NYC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='1c40bad892097eb8401c1f0d06195ca8890f9c8062715c07d2ffa00abe563067';
COUNT=$((COUNT+1))

echo "  [89/549] Would restore: HVAC Hunters"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='9cddfadd11b1b7c1a87de8cb4ace3ea6c0bfd34d323ffcb8d856a71719717759';
COUNT=$((COUNT+1))

echo "  [90/549] Would restore: Manhattan HVAC & Appliance Repair Inc"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='2e15a6235ee8f4cbd63ff5109e812d20cd341f025d2b6b7cc50593663df97c5f';
COUNT=$((COUNT+1))

echo "  [91/549] Would restore: American HVAC Corp - Brooklyn, Heating, Air Conditioning, Refrigeration, Ductless Mini Split, Rooftop, Commercial HVAC NYC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='88645cba8a6c32a9028ea348194625524a8fef3fdf4eb0a8933316ccf72affe8';
COUNT=$((COUNT+1))

echo "  [92/549] Would restore: FLOW HVAC NY | PTAC Installation & Repair NYC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='0f69bf8a93631d1b91bf34cb6fa748063f9e690a91d46a036bf28427f23df874';
COUNT=$((COUNT+1))

echo "  [93/549] Would restore: 24/7 HVAC LOCAL OF MANHATTAN NYC ELITH"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='eb2aa176c5d07f9ca0a8090bb0dc607d0c74c01661aa72567c349702218466f8';
COUNT=$((COUNT+1))

echo "  [94/549] Would restore: American HVAC Corp – Top HVAC Contractor NYC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='d295be336c9dabece1ac9562cd4f326c0e211bfdc7828ea9c9ebae444141a716';
COUNT=$((COUNT+1))

echo "  [95/549] Would restore: Thee Electrician LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='534d9e81920b49aeb3c3508a4553e620fb00c4a0f31871e79253fd1a27315666';
COUNT=$((COUNT+1))

echo "  [96/549] Would restore: A 24 Electric Co."
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='3f69697b1cc46ebce07618c47745c9e6b678db0d52bc43a047065ce0216d25bc';
COUNT=$((COUNT+1))

echo "  [97/549] Would restore: Sparkye"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='4e63d595f72b36bc62a13e9aba64f2285f616f89c90084cc061e644dd75d317e';
COUNT=$((COUNT+1))

echo "  [98/549] Would restore: Max Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='db59b57014cebbcbf189524ed00c1e66ff56bfd805448be06518469931739209';
COUNT=$((COUNT+1))

echo "  [99/549] Would restore: BV Electric Inc."
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='86ff02af0a26fa7b5856aad63e6aa94bb0e8477910099335368bda3f7691f7c2';
COUNT=$((COUNT+1))

echo "  [100/549] Would restore: 7x7 Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='620ac4c95dcce99061a83236d2a7b307fa87864c9dd41a0c3a7c9c8931811d71';
COUNT=$((COUNT+1))

echo "  [101/549] Would restore: One Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='ea271916d7bf8d9a6d7ca3d506c069c2c4195f04788917e4afc12a16bf21b17e';
COUNT=$((COUNT+1))

echo "  [102/549] Would restore: ROOF EXPRESS"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='8461313f8cd8a8222f7b05ed6360b48a12a1063ea7161db4813f540f5dc4e2bb';
COUNT=$((COUNT+1))

echo "  [103/549] Would restore: ELM Roofing Contractors Inc"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='68f98e8960397ca219032860547343cf1994deb8ac28bcdcf4a4cf40f2254581';
COUNT=$((COUNT+1))

echo "  [104/549] Would restore: Marina Bay Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='15052c3e2b968e90b7eee8f34aad5527a124d8ec3c6ea600a55608dc6b035e35';
COUNT=$((COUNT+1))

echo "  [105/549] Would restore: Air Flow Pros Heating and Air Conditioning"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='10f2725e66557132328e53bff0ba50176942a1cb36cb1ee976773a1a003ecaed';
COUNT=$((COUNT+1))

echo "  [106/549] Would restore: Heating And Air Experts"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='fc12489c88087937c12e21abba895720480ae84dbe8a8471c039e62b538cda75';
COUNT=$((COUNT+1))

echo "  [107/549] Would restore: Magic Plumbing Heating & Cooling"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='46fdcbb9095a0fd7f12ad3230a2d297ff16efd0a6a592b8ad9e75aa7d9e6f989';
COUNT=$((COUNT+1))

echo "  [108/549] Would restore: Sweeney Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='7a92bfba2226c8727d4b864482fe510ee2cd8fc466f2cb7f560e4708aae1567f';
COUNT=$((COUNT+1))

echo "  [109/549] Would restore: Bright Power Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='5f52d4707e16e5ce1e0a8e6d348adca11ec71f0696982fe554770fa478ef5f26';
COUNT=$((COUNT+1))

echo "  [110/549] Would restore: Point Loma Electric, Plumbing, Heating & Air"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='30cc757c57c451f7fdd2fb27f9c5a169791da89373c9bf2dd6b2fc994f3a929d';
COUNT=$((COUNT+1))

echo "  [111/549] Would restore: SRP Electric Inc."
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='11983f97de4306f4e6fe1a8b6d56bcee1b184e987e7eea3fbd21864c757286d5';
COUNT=$((COUNT+1))

echo "  [112/549] Would restore: Resilient Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='9679f17c86d2d01c47b71deec99f889c408850beaea0e190db308a8b1f61a773';
COUNT=$((COUNT+1))

echo "  [113/549] Would restore: Alma Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='ce3dc19df88fceba59dcd1aeee074a3bf8dcfd843f144c01da7b8e1ae92ec867';
COUNT=$((COUNT+1))

echo "  [114/549] Would restore: 619 Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='e6b00ae1f530d5b7c91e157fe1718b7fb1d091c96b2e045942ed57e263eeac07';
COUNT=$((COUNT+1))

echo "  [115/549] Would restore: Plumbing Tree"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='674c96c33d7cc3d7cf49466f442087e2906e6a14fc1128dacc77f5f353b09e77';
COUNT=$((COUNT+1))

echo "  [116/549] Would restore: Elite Rooter Plumbers"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='98bce8804499e78ab7d8a871e7d6a3180d6e5fedb7de3281b9134984ab2630f4';
COUNT=$((COUNT+1))

echo "  [117/549] Would restore: Black Mountain Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='114996f6c014ebff06a49b63f39fbd4da4fc85ffadbd4fd672fbdcdb72342e2a';
COUNT=$((COUNT+1))

echo "  [118/549] Would restore: Core Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='f240ee750a35ac3c4ec3d1190473585f0616c50bc82b433091e8345afe91ad7e';
COUNT=$((COUNT+1))

echo "  [119/549] Would restore: Smith & Sons Heating and Air Inc."
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='a57e2549eadf1530ca3d48c116ced3f1d6aaf7af98ac1d07eb20b0ef8293f786';
COUNT=$((COUNT+1))

echo "  [120/549] Would restore: Comfort Air Conditioning & Heating"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='1fcca117db877277ca791850ac56725015ce1af98693585ea45f0dd81d716755';
COUNT=$((COUNT+1))

echo "  [121/549] Would restore: EZ Breezy Heating & Air"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='65587bd04dab90cc7d1f30089a6fd136dc40e81266e1d3ff11fd8d5e86263304';
COUNT=$((COUNT+1))

echo "  [122/549] Would restore: Stable Temp HVAC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='b7d7d3c2a05781e12c851e7d1fc42fcef11ea1d5284dcc45d40f6674e82b3b8a';
COUNT=$((COUNT+1))

echo "  [123/549] Would restore: All Things Roofing LA"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='6b00e161b328dd834682bcbec704957f98c5d3ffa598a6725f2cf8a0b593dbe8';
COUNT=$((COUNT+1))

echo "  [124/549] Would restore: The Local Roofers Builder"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='1aaf9c4d65e15dd64ce5ecc72f592f1cc3a2f4ba53e8c6d236a8334f0d043fff';
COUNT=$((COUNT+1))

echo "  [125/549] Would restore: Quality Roofing Specialists"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='d48f4298ecdcb5d40962047e947f4274ff66cc3c5ec42c5a26dc17ff3455bf4d';
COUNT=$((COUNT+1))

echo "  [126/549] Would restore: Francisco'\''s Roofing Inc."
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='1d8a06669ccb678150b796b65a5f2326ed5c59056dc720cc7c4f97d149aa685b';
COUNT=$((COUNT+1))

echo "  [127/549] Would restore: All In Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='bb11f86eb5bbdfe262d6673dfd48dc89e5452bbb3ee6966ef683df0198bcff94';
COUNT=$((COUNT+1))

echo "  [128/549] Would restore: Pacific Plumbing Team"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='e7f62613d53720c0e4ef9b3ff3d2e8ca0b82bb0bc05008f9aa8ac0004d4b49b3';
COUNT=$((COUNT+1))

echo "  [129/549] Would restore: Precise Air Systems Inc."
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='2fe81df4e66d88f5dcaa2a4fb1a486cd1b18dd9acadfeb2049916dc58122f82e';
COUNT=$((COUNT+1))

echo "  [130/549] Would restore: Southwest Heating & Air Conditioning"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='9134c9a2bbccd367bff6f5a556cb086cbe3ef06f27e5e5fdb773678461cfaf66';
COUNT=$((COUNT+1))

echo "  [131/549] Would restore: LC Heating & Air Conditioning"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='25cc2a516f5f566792dfbafc0a3566834342557135cf6b949a281f8973180c56';
COUNT=$((COUNT+1))

echo "  [132/549] Would restore: Brody Pennell Heating & Air Conditioning"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='f192d86eadb0afba6748234790b8dec6777c6aab1c7f074667a3ea3178761144';
COUNT=$((COUNT+1))

echo "  [133/549] Would restore: Empowered Electrical Solutions"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='1c956ce95166c373bc6e6c34a06fcd07006b805593af8861c46ab3d2ba72826b';
COUNT=$((COUNT+1))

echo "  [134/549] Would restore: Volthouse Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='d38e1b86db911f86ecddbca157ba827f558a1adce03476518c2ac0694b42d300';
COUNT=$((COUNT+1))

echo "  [135/549] Would restore: Allgood Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='bca859082b10e782c6152776288e24090fc74b6fb192734cafcd1d8d4cd0f0ba';
COUNT=$((COUNT+1))

echo "  [136/549] Would restore: Blueline Heating & Air Conditioning LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='79adac87d5b43ce7978d8e189beb46f8b5bf3af3edfdbca6e9ce0f9cebafac80';
COUNT=$((COUNT+1))

echo "  [137/549] Would restore: Lex - Air Conditioning, Heating, Plumbing, Electrical"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='ee91d3ec4b3cbd56c8bc498cdbaee4f0efd59aafc8eca7f7e59e7ae247fb6858';
COUNT=$((COUNT+1))

echo "  [138/549] Would restore: Roof Repair Solutions"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='e3660416d1783db8b159650279def718756d9df4171e2f98beaf09bb1e68d2d6';
COUNT=$((COUNT+1))

echo "  [139/549] Would restore: Detroit Roofers"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='f4848ed107841e1ba266f0ef6bb6260289c534795f24b50dd9177e51b5ca4142';
COUNT=$((COUNT+1))

echo "  [140/549] Would restore: The Detroit Roofing Company"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='741e873e1e2519666c12a9ad832753fffd2e2dc422865d4a1a101cc85f855227';
COUNT=$((COUNT+1))

echo "  [141/549] Would restore: The Heating and Cooling Company Of Detroit"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='0a60e15f0d3dd1311380b80c23d662fa70afe15c37ce0238ddc9ba88ae2e5ca7';
COUNT=$((COUNT+1))

echo "  [142/549] Would restore: JD Cooling"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='e4b0c3a3be96bc8ea1e4a6133a596d7e51a0121aa7d3b92dd7fb96f1223c25b7';
COUNT=$((COUNT+1))

echo "  [143/549] Would restore: Maxx A/C & Heating"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='d1767e3f8da0ccb2cc5b915746dbc608e7d44ed32196f80787bf8a1ff48b61c9';
COUNT=$((COUNT+1))

echo "  [144/549] Would restore: Brown Air Conditioning and Heating"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='d85fd2f0c4620a682097b13dd5d9aac883f706fcdfc00818aa378f7252a92431';
COUNT=$((COUNT+1))

echo "  [145/549] Would restore: Air Dynasty AC & Heating"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='c298ca5aa022e31e7220fab7f4ab7c7ad1b3ffef7c18874d80d4b2bd8e86fb6f';
COUNT=$((COUNT+1))

echo "  [146/549] Would restore: Air Check Mechanical Services"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='61378a3c1b2444ee9db93e81ce17ea64aa98262f3c1faee1e389988a597c4a44';
COUNT=$((COUNT+1))

echo "  [147/549] Would restore: Marcos AC & Heating"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='1ef06191081b9f769bdb0806aa4d8e695ea6990e4ac8557781f04e2a5f9f0901';
COUNT=$((COUNT+1))

echo "  [148/549] Would restore: GotFlow Plumbing & AC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='e928585b2951842286856bc91dd9714abaf5f0d26f9033a7964ddb8a0d5e0166';
COUNT=$((COUNT+1))

echo "  [149/549] Would restore: Rapid Heating & Air"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='f7f1057a5861b5f7ce4356341f17868c0dcffdec94eacd99f66715aa3c50bcae';
COUNT=$((COUNT+1))

echo "  [150/549] Would restore: Imperial HVAC Services"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='e89a2106be96006d5e8f0e7c1253dbbf4d58f7e8643e18b34ca59c9eb32393fb';
COUNT=$((COUNT+1))

echo "  [151/549] Would restore: Houston Premier Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='50f1febe0c6d8a6e6fa4805fde75463e173aebd674208c36da0d35ece5508c85';
COUNT=$((COUNT+1))

echo "  [152/549] Would restore: Knight'\''s Mechanical"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='c45302c33fb3aff61bd6ecc824015862d70db8e83e3daf36e85d33d0a50199ad';
COUNT=$((COUNT+1))

echo "  [153/549] Would restore: Mister Sparky of Houston"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='edefcdec95d61100b27bd15863360466600802b439edcc1ec5adb5876ff2ea66';
COUNT=$((COUNT+1))

echo "  [154/549] Would restore: Blue Collar Services"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='523c31e2401228aa41ab7a0ee8e4d0679c50a3ef1d037382c2360f5f8fb04cf1';
COUNT=$((COUNT+1))

echo "  [155/549] Would restore: ACT Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='9f871f777ef0b8a5641c8680faf1201cd59f639e537bfdfe7919d15c15ce2596';
COUNT=$((COUNT+1))

echo "  [156/549] Would restore: Miller and Sons Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='e411f41f001f0be8216f7f31598afbd65c4134b46aa2b0b2a3dd145d0bc61202';
COUNT=$((COUNT+1))

echo "  [157/549] Would restore: The Wire Guy Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='42b2c711c4c38c4c12b52af210e00a062bfaec4cafbbd41734e83c2626abfb2e';
COUNT=$((COUNT+1))

echo "  [158/549] Would restore: Redemption Roofing AZ"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='aa2a3354026d3c9bc01d168fb9deb95620e02f3465ed64a7ed47778ceac05950';
COUNT=$((COUNT+1))

echo "  [159/549] Would restore: The Roofing Company"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='c17d60ce38d943a45d56caa35ceebbadef8cc0085963adeb2b53b2e26c76f306';
COUNT=$((COUNT+1))

echo "  [160/549] Would restore: Right Way Roofing, Inc."
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='af43b884abcf8a2e391b89ab462e0575799ba31dafd479b0541efb6fff649fcb';
COUNT=$((COUNT+1))

echo "  [161/549] Would restore: Superstition Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='05eccc3620d229d565a178057b7951cf8c5283f2bb6f5164bc8a18c9745c3231';
COUNT=$((COUNT+1))

echo "  [162/549] Would restore: OX Plumbing Services LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='269c0653fc79eff3c91c37a172ba16cd7abff8d15c61316b4e90f4987cc31cc0';
COUNT=$((COUNT+1))

echo "  [163/549] Would restore: Total Plumbing & Drain"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='a6263a9cf93f5e6f7f6815332b2da68560d8c350c2f835ca215c814679f97a74';
COUNT=$((COUNT+1))

echo "  [164/549] Would restore: The Plumber"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='06407ecf1fb39074df5b58270c59b4f634580ad41cc2266fd00a1567958f056f';
COUNT=$((COUNT+1))

echo "  [165/549] Would restore: The Cooling & Plumbing Co"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='5c0b89df107d202b3cdf3b9213b7af104766af281c42ea0a9493660964b5b11b';
COUNT=$((COUNT+1))

echo "  [166/549] Would restore: PlumbSmart Plumbing Heating and Air"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='cad62f1f58743124c949d6e520762f0c7ff4b674f65423410b250ad59c72b86b';
COUNT=$((COUNT+1))

echo "  [167/549] Would restore: Sagan Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='420fab5f4ec0e24a0e78b53c1438cc23ddb615b94cb8bcef285df5933dff4ed3';
COUNT=$((COUNT+1))

echo "  [168/549] Would restore: OldTown Electric Inc."
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='9888de269fd89b77dc4531cb2dc9b25d310487eb2615507e5ce8862009bd06d4';
COUNT=$((COUNT+1))

echo "  [169/549] Would restore: Myro Electrical"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='e666d7ca0e82914f950357278e7475f1a9594b3cded0fa1ea4761387394baed5';
COUNT=$((COUNT+1))

echo "  [170/549] Would restore: Four Ace Electrical Services Corporation"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='7842e5a4b1a64298de240b58a2924693864ed9e90c3c21dddc9c096c3cd476f5';
COUNT=$((COUNT+1))

echo "  [171/549] Would restore: Peach Electric Inc"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='3fa91ab9f071afe404dd591859080eb28f500461178be6d7dfcb2c013c2097c1';
COUNT=$((COUNT+1))

echo "  [172/549] Would restore: Maverick Electric, Heating and Air"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='45fced0ce0d4be02274603a83988e0e0caef86365e2affe93a90169a6c5fadf7';
COUNT=$((COUNT+1))

echo "  [173/549] Would restore: Match Point Roofing Inc"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='0ffe48500db9f58a302c7adddf1dfb8a085ea7a03e09a1a824f93c3fd8eccb7a';
COUNT=$((COUNT+1))

echo "  [174/549] Would restore: Roof Doctors Sacramento County"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='d5a249891d173eaba7c170e127d47f7107d48e6f197d443090cd5d18b6711adf';
COUNT=$((COUNT+1))

echo "  [175/549] Would restore: Cisco'\''s Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='8a5c5ca9701eb8be8dbb309bfabd257df10aa4e868889f4c55cb4b05626f3cb3';
COUNT=$((COUNT+1))

echo "  [176/549] Would restore: Los Reyes Roofing Inc"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='4bc835e0ce8ebd29a0cc22e7bbdd1c43df1bc0e7b83c46ab7d616088581987bd';
COUNT=$((COUNT+1))

echo "  [177/549] Would restore: Sacramento Roofing Service & Contractors"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='c9b5b250e17d5f6e16ba8ef7ea0e897a8e47e37457c7029ad01b1e71b46dde37';
COUNT=$((COUNT+1))

echo "  [178/549] Would restore: Elite Roofing Sacramento"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='0db18881d0dc6e5857e57f085eda06cfdfcc98fea19a5f5ab5dfcd9176f75dd4';
COUNT=$((COUNT+1))

echo "  [179/549] Would restore: NorCal Roofing & Construction"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='84e8ce3806787aea982a75ed3a665037d7490d7349f977c2aaeb7d7dfabab964';
COUNT=$((COUNT+1))

echo "  [180/549] Would restore: Sacramento Roofing Inc"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='f3399fcc8fa2af04f4b450481691a4a5f7023fc945662de8bfb073b6a51f4b0e';
COUNT=$((COUNT+1))

echo "  [181/549] Would restore: Titan Roofing Solutions"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='75a2f2efadbd5276bfbb82a67ea995c72a6cee31eb7ccfb67c990cecfb3bb6f8';
COUNT=$((COUNT+1))

echo "  [182/549] Would restore: Ace Plumbing, Heating & Air Conditioning"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='d3023a7d943ea2431b47e247846c234da66ce47759796f3f7db9d68f32a2914a';
COUNT=$((COUNT+1))

echo "  [183/549] Would restore: 5 Star Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='16960e1ba7faf91ca751ff977336ba1ae6e38a905f0c691f85c848f861150830';
COUNT=$((COUNT+1))

echo "  [184/549] Would restore: The Trenchless Co."
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='10ca92aa35f43b2a946447b2d6c130149ed27081202e0600a7fa00bb31ddde6e';
COUNT=$((COUNT+1))

echo "  [185/549] Would restore: Rooter Hero Plumbing & Air of Sacramento"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='6f8c81187162877829e5390a823574b869c16c54cd4d13ebce5aa378dc3e39b0';
COUNT=$((COUNT+1))

echo "  [186/549] Would restore: Platero Parada Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='bd0561539f146dbf6b8068644e52afcf0a17c1a711e437a3daebbd53ec16d4d5';
COUNT=$((COUNT+1))

echo "  [187/549] Would restore: Millennium Plumbing Specialist, Inc"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='9bf9581b01ce41eeeac64e7acf4c5f9750101c52e7e6a38e1c2a72671aadb29f';
COUNT=$((COUNT+1))

echo "  [188/549] Would restore: Armstrong Plumbing Inc"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='ed73b5b28ebcb057d1dd5fac21b3ece37f2e58b5cdac6f71a467c770ee09770a';
COUNT=$((COUNT+1))

echo "  [189/549] Would restore: A Cool Air, Inc."
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='6c82d6ef6723e7284105d705037b2a1283c810c1de02ec19d06df38af1f110a4';
COUNT=$((COUNT+1))

echo "  [190/549] Would restore: Jaguar Heating & Air"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='0893f1e689119b2e0d9bf08647da230f05c2d3501c09fad2db033c24d7c199ed';
COUNT=$((COUNT+1))

echo "  [191/549] Would restore: The Roofing Crew LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='0b710eee00d54d1243a0de89ab16b51946052ebe5699b04adc91d40e6c168b62';
COUNT=$((COUNT+1))

echo "  [192/549] Would restore: Roof Maxx of N. Fresno, CA"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='f68a7a71aabea484307a0615f0e2599f93f4f24d142f6fae12179b9dcb464535';
COUNT=$((COUNT+1))

echo "  [193/549] Would restore: Roofs 4 Less"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='bf54e69e4047ce920b80c9b35ac25fea0710b41bfc3458372db0f8778038c173';
COUNT=$((COUNT+1))

echo "  [194/549] Would restore: Zinc Roofing & Air Conditioning"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='1a98798a52ab407269e357cd005502e5d440130f3cad841c3e97b4e8ab533670';
COUNT=$((COUNT+1))

echo "  [195/549] Would restore: High Impact Roofing Inc"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='8c4628dd9ec61a4846ac5f21df3651d321bac5a932914321f46d48f54cd09e23';
COUNT=$((COUNT+1))

echo "  [196/549] Would restore: Best Choice Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='28e1d6839ef64d11bc2ccc1fa47d14c30fe09196f9cce746235a8e9cc6d293c2';
COUNT=$((COUNT+1))

echo "  [197/549] Would restore: New View Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='3abce076c595f3431130303fe0fffd77cb50cca222f23c8bb236c11e0f6c18e2';
COUNT=$((COUNT+1))

echo "  [198/549] Would restore: Fresno Plumbing & Heating Inc"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='7bd0a01f79901a9917f4c399c7d62ac5b83dbde2825ad91c72443ce85e4727d7';
COUNT=$((COUNT+1))

echo "  [199/549] Would restore: PDS Plumbing and Air"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='cbab7f3b47894b395b42c315c2a2b4d92c7033d34d76412b3ee91238bd992c87';
COUNT=$((COUNT+1))

echo "  [200/549] Would restore: 911 Plumbing & Electric INC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='526a4404384b238aeabfbf93b2918a3e8f829a1229b7e117666d832e3d8975eb';
COUNT=$((COUNT+1))

echo "  [201/549] Would restore: Rod'\''s Plumbing Service"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='9318015445b04361662de86f2c8e626eadb9116f408a6a00166be6f6310a4c6f';
COUNT=$((COUNT+1))

echo "  [202/549] Would restore: All Star Plumbing Fresno"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='a1867448d14329f72ab62d315b5b05d25d692c6ac6762f11efd5d102654df4b3';
COUNT=$((COUNT+1))

echo "  [203/549] Would restore: Low Cost Plumbing Services"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='1d04716f4b7e0e4240f2b2669ba533273a96b0a8f2e2277995cf747a512d0c74';
COUNT=$((COUNT+1))

echo "  [204/549] Would restore: Golden Comfort AC & Heating Repair"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='0fd46afb5776415e6b172780ab43823daa2ad8cc135ffe405a7cfa0cfce9f7fc';
COUNT=$((COUNT+1))

echo "  [205/549] Would restore: Allbritten Heating, Air Conditioning, Plumbing, and Electrical"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='8ef68ebaaf19735b07648e91aaccab12778ec8b9b0924952a3a5b7ac3ea844a1';
COUNT=$((COUNT+1))

echo "  [206/549] Would restore: Valley Air Conditioning & Repair, Inc."
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='c06e9878f8966a6cfcfaf87fcaf4567b0e2886519e621cc979b3eee03782b30c';
COUNT=$((COUNT+1))

echo "  [207/549] Would restore: Fresno Heating and Cooling"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='beb99bdc5535b97289ae64642121ebc8c5e17f27bb6b908cc84587a6e3bab014';
COUNT=$((COUNT+1))

echo "  [208/549] Would restore: Balanced Comfort"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='5f3b9c1141e1126ba6154bc0f38746557f2844b5a9d1a76e8b3faf935f1d7587';
COUNT=$((COUNT+1))

echo "  [209/549] Would restore: DSR Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='7d54359d51aa30f5972c94f841e68a6c3d1812b991d8444ac443467f14ef83ef';
COUNT=$((COUNT+1))

echo "  [210/549] Would restore: Sunset Roofing, LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='3495cafaed4e51247f3c3ec4649aa52ec168d64459ea1bb03812d55771b438d3';
COUNT=$((COUNT+1))

echo "  [211/549] Would restore: Modern Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='369864345b8c2797dbe13ae84ad3f744487599e649815ebf854a4c1ab679e10a';
COUNT=$((COUNT+1))

echo "  [212/549] Would restore: B&M Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='526f409f112334358c6df13aae500efa5d52029eacdbdd5fe6933640978ecaf7';
COUNT=$((COUNT+1))

echo "  [213/549] Would restore: Canyon Roofing, LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='44c63056ca95536f12e5d87ab903cbb96ef80a0375b2bbc6aedd5c760781b88b';
COUNT=$((COUNT+1))

echo "  [214/549] Would restore: Jobe & Sons Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='c6bc8a7f82174887ca414f524180c4c4a1eb9fc0c8c2d2f4f95e17b4e053e66c';
COUNT=$((COUNT+1))

echo "  [215/549] Would restore: Code Blue Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='7cd2986d3742b31f0b9fa4c43ad3d401394c0f4c7a2838c4acec926f6a05cd92';
COUNT=$((COUNT+1))

echo "  [216/549] Would restore: Ram Plumbing, Inc."
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='8ea0931b3fbb8c4c344fa2ae6d92fe184312fb691ecdb18f838f6bbb205ca3f4';
COUNT=$((COUNT+1))

echo "  [217/549] Would restore: Tucson Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='52d9900f11ad4a7ed69b971c59e5e9da6532a813406c1b6764336f768444b966';
COUNT=$((COUNT+1))

echo "  [218/549] Would restore: Imperial Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='477ccaf7a8fa62c3e8d137e44980294a6e9a9a96916585d6deb1340bedbf617b';
COUNT=$((COUNT+1))

echo "  [219/549] Would restore: Al Coronado Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='8dd50a1b0f83fbfb17c1f1024a2884122cbdf128368f29d7428dc5741839f010';
COUNT=$((COUNT+1))

echo "  [220/549] Would restore: GoodFellas Air Conditioning & Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='3c720bb31e6493fe7a93c5395bb7fd52e369b92530d7da3e0c53836e0584b6ae';
COUNT=$((COUNT+1))

echo "  [221/549] Would restore: Alaskan Air Conditioning & Heating Tucson"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='26e82ebec08bb853231e3272cc43a5923e5a16d8afc445ede7ba7f600c1ea394';
COUNT=$((COUNT+1))

echo "  [222/549] Would restore: Intelligent Design Air Conditioning, Plumbing, Solar, & Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='190a90cc2d637a99ccf356e02b9375c269b24612a19f69ee0d2082943920a526';
COUNT=$((COUNT+1))

echo "  [223/549] Would restore: HVAC Heating & Cooling LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='d9c573b74659797bb765463a93c2fab6a451d20a205f5a8c09507cb61d18a5c0';
COUNT=$((COUNT+1))

echo "  [224/549] Would restore: True Light Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='f023dc27c554f72c7b29ed1e932198047ff1755670d291a4a0936280036ec61c';
COUNT=$((COUNT+1))

echo "  [225/549] Would restore: Dove Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='ea94838f6f33a023c5f713d1dacf3716fb02b6568b07a8ceb1cdde1f9db16540';
COUNT=$((COUNT+1))

echo "  [226/549] Would restore: Energized Electric LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='1247801c96cf4d20dd57e9d1eae5c1f793dfcbb98c1e5ae7cb86ace31aac46f2';
COUNT=$((COUNT+1))

echo "  [227/549] Would restore: McDonald Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='83810e04febc8cf3a3f417ebaec3d3bf077c41b177905772079fb30a5aa5841e';
COUNT=$((COUNT+1))

echo "  [228/549] Would restore: RMC Roofing & Construction"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='2b7e0f0b475fecb239895c7c0b254eede27495888170bfbaadb52d5700859fac';
COUNT=$((COUNT+1))

echo "  [229/549] Would restore: Paramount Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='0279e0618ca40f7aff1ac891f130883d8c6a5cbb6988cedd1ccf887d8d8812d8';
COUNT=$((COUNT+1))

echo "  [230/549] Would restore: Altitude Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='e6e4620f920003efa86987ed1d915b45196416fa3b90eec42291fb13d92e9f6a';
COUNT=$((COUNT+1))

echo "  [231/549] Would restore: All Seasons Roofing Albuquerque"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='66f5175d606c10e508493b161bdf88dfa889339284d24295b1739db1f744fd8b';
COUNT=$((COUNT+1))

echo "  [232/549] Would restore: National Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='ffbc72f56989b742aaa8c79785e01ca632cea65d39196753f9e82339966c6948';
COUNT=$((COUNT+1))

echo "  [233/549] Would restore: Homerun Plumbing Heating and Cooling"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='56d8d6890012044a8bb044121a632f02e6da51b67a76bcf3ef127c869a507b64';
COUNT=$((COUNT+1))

echo "  [234/549] Would restore: Number One Plumbing, A/C, Solar & Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='537563cca62e80ae1173388f0775430879c0ee71e673ca42592ed9cc359f948e';
COUNT=$((COUNT+1))

echo "  [235/549] Would restore: Pen Pals Cooling Heating Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='a3d4dbafeb0381f26cb28eeb04dfdf200ba1ff0f20013efd00896c31f30bce7f';
COUNT=$((COUNT+1))

echo "  [236/549] Would restore: NCB Mechanical"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='dba4348f8daa7a23501657913a616ef8f535961cbfa4a1c70ec73946262a94d6';
COUNT=$((COUNT+1))

echo "  [237/549] Would restore: Thompson Heating & Air Conditioning"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='011c922933a9b88e5a46b10afc5f9a59811b2a95b9dc2304953f04953e662dda';
COUNT=$((COUNT+1))

echo "  [238/549] Would restore: B. Carlson Heating, Cooling & Plumbing, Inc."
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='2e0a19542a8f727cae0e8b0e94d2073c38ad3405f121a9014b5ca29e3ab53fc5';
COUNT=$((COUNT+1))

echo "  [239/549] Would restore: Anderson Air Corps Heating & Cooling"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='6952c8eccfdf85cb6bfbf7ad524f4461edb30ecf5aa46582468651ca66ddc0e9';
COUNT=$((COUNT+1))

echo "  [240/549] Would restore: Air Care New Mexico"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='947994da26ed35b0440d053b4673811828f5afa4ab5e1decb5f80b8d38398e43';
COUNT=$((COUNT+1))

echo "  [241/549] Would restore: Best Electric Service, Inc."
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='5260d655c27bc68330397ae183a6b48a2825b92ba70938653b01e53d9934671d';
COUNT=$((COUNT+1))

echo "  [242/549] Would restore: Advance Electrical Contractors"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='09ff398116c5a6aa3cb24308145d84ca3302ae8e67683138fc43808f13691881';
COUNT=$((COUNT+1))

echo "  [243/549] Would restore: Lehmann Electrical & Design"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='87cc76538f950b58441377020170022748d62c7c326fa63021571423d5de8177';
COUNT=$((COUNT+1))

echo "  [244/549] Would restore: Prime Electric LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='7197569aef282142f396d9431bc4cb5d676fcc2c2e4e700691f51fc8cba30f7a';
COUNT=$((COUNT+1))

echo "  [245/549] Would restore: Alteri Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='d24be770728e174c148b868e6be91867127b1e005caf9a7aaa9c34a55adf680e';
COUNT=$((COUNT+1))

echo "  [246/549] Would restore: Current Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='bf3d3d9445df8e068f1fe77ab65f2da0f1b1fec015d90c009c84f2418f0a5745';
COUNT=$((COUNT+1))

echo "  [247/549] Would restore: Ridge Top Exteriors"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='e9a6e9b0e482a6f2b305b5f9d590dd15f782881e66e21f764401cab6b83ac134';
COUNT=$((COUNT+1))

echo "  [248/549] Would restore: Community Roofing & Restoration"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='55db3a020020e678b0854579f22c26c897fb7fcb2d7e47723c7be38a8f7b703a';
COUNT=$((COUNT+1))

echo "  [249/549] Would restore: Milwaukee Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='12771b14efa5fccb0ef5b2addb44b5fac518ae0cae408f8516396f9d75effaf1';
COUNT=$((COUNT+1))

echo "  [250/549] Would restore: ABC Sewer & Drain Cleaning"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='012bc4c729a1158e6169149435dd3961ff4238f8db71adf5f88e034c4af508ea';
COUNT=$((COUNT+1))

echo "  [251/549] Would restore: Milw Drain Cleaning"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='6499ba30d024df40167e309a7c56b53c3c6e2f9341755d1055e0c59f474300fa';
COUNT=$((COUNT+1))

echo "  [252/549] Would restore: Affordable Heating and Air Conditioning, Inc."
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='610edc597a85f1ec996da15e149a674a65fbe1d3e652d0bec991e03a41ee6b43';
COUNT=$((COUNT+1))

echo "  [253/549] Would restore: Third Coast HVAC, AC & Furnace Repair"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='f2a9ee0c92a943d56e3ce2dc3e37c03a5e39db9a97e6dd7a05dbaab33b923878';
COUNT=$((COUNT+1))

echo "  [254/549] Would restore: A-1 Milwaukee Heating and Cooling"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='18cf9201ef646e0ee0c7dc98d1595b2390f253b84cf8c02132f8fafced66c773';
COUNT=$((COUNT+1))

echo "  [255/549] Would restore: Burkhardt Heating, Cooling, Plumbing & Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='c0b0113cf381b7e0cd2ed7ccd14f2c1d21bbccc145c43cddb33bc6369a5f24d3';
COUNT=$((COUNT+1))

echo "  [256/549] Would restore: Baltimore Roofing & Remodeling"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='f51722317e166b380327abcf90ba0a7ce1f0b9cdc22e99c91ce752807f29e412';
COUNT=$((COUNT+1))

echo "  [257/549] Would restore: Ruff Roofers"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='f9fbc627bca306b8b65e705eed028d7eeb903d132ff3df85c0e8ccb6fd9e5876';
COUNT=$((COUNT+1))

echo "  [258/549] Would restore: City Builders"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='f9f262ea1b69dd750147c5f62c829b094e3ca5d7f797b86c2520d360670de45c';
COUNT=$((COUNT+1))

echo "  [259/549] Would restore: Park Heights Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='eb25b7887452eef57d520b0e881397ad8dea2aa661e4688df73bb0039132cc8c';
COUNT=$((COUNT+1))

echo "  [260/549] Would restore: Mr. Rooter Plumbing of Greater Baltimore"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='c4d9a1fff2971b710eeb11ed6eba87d1f129ffe4a0c4c7d9be247f280c2db98a';
COUNT=$((COUNT+1))

echo "  [261/549] Would restore: A.J. Michaels"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='ba0a742c1a99941adc66c2a3cd18f1751984a2e5a4d578a8a43afe51761a3584';
COUNT=$((COUNT+1))

echo "  [262/549] Would restore: Amazing Plumbing, Heating & Air"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='b4c301ba08db7e4e77bc04d91924d68d3037ea02e433aac891a3ca408f53df65';
COUNT=$((COUNT+1))

echo "  [263/549] Would restore: Maryland"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='18a3b34ce4776fe7792004c306c8270f6ec5e0a5acbb35f68ad1db2c5d0fe9b6';
COUNT=$((COUNT+1))

echo "  [264/549] Would restore: St. Matthews Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='0d28219a4c251df5429e5cb3e4079952dec7a8fade8a60732753a872351bb4db';
COUNT=$((COUNT+1))

echo "  [265/549] Would restore: Durbin Electric LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='9703faddf80e8bba3d9a671f5f5aa85a63ea5e2cbd9535b11b8dfbf5a481b54d';
COUNT=$((COUNT+1))

echo "  [266/549] Would restore: Laswell Electric & Security"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='66d5c03937934062eeeed3d034a1125b3e6f5cce9932fd9929e461ea554b4e9b';
COUNT=$((COUNT+1))

echo "  [267/549] Would restore: Origin Roofing & Exteriors"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='1f1ac7e540169a758adce8db58c7b0dc5e42bb165bd366b4918eca6d058e0f95';
COUNT=$((COUNT+1))

echo "  [268/549] Would restore: Roof It Right"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='fa951f86c0a79d834337dc3a5a16ce966ebd595b060f3c66871dbf91cac982d2';
COUNT=$((COUNT+1))

echo "  [269/549] Would restore: Mr. Roof Louisville"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='9dce5d09235814e69def8438b3469c1d3b3fa621bb2f15fec3fba2105d92b3fa';
COUNT=$((COUNT+1))

echo "  [270/549] Would restore: Pure Roofing Company"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='936ff675e820bb36efa803895a725518ff71c46cdc1eff81a100b71026199321';
COUNT=$((COUNT+1))

echo "  [271/549] Would restore: Christian Brothers Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='2d7f0189c9d763a17100c03419617948b09ba43d799a5566e9c2660dac68432d';
COUNT=$((COUNT+1))

echo "  [272/549] Would restore: Big League Roofers"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='6f255a175fcba2941da4e36f69ceae70126a4df3dd8b419fb89f67f0976ad115';
COUNT=$((COUNT+1))

echo "  [273/549] Would restore: Daniel Brown Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='1131d0d31fa1d2f91e15d66d73185b0a0177a40852dd88b472cfbd12b84ea032';
COUNT=$((COUNT+1))

echo "  [274/549] Would restore: 1-Tom-Plumber"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='3cb2714b13fb0e0f7c19110caf91c2a5e66040a90d6c77ce0c5daf55cb180f7e';
COUNT=$((COUNT+1))

echo "  [275/549] Would restore: UR Best HVAC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='216d966eabd490a830b812d6a6dbae3062d16136b1ddd3b7a37beef74fbc94c3';
COUNT=$((COUNT+1))

echo "  [276/549] Would restore: Tom Drexler Plumbing, Air & Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='12eb5ee8a3063bf7b9e9f05e2af8e67fdaf09b324dfcd0d2606b41d325f19512';
COUNT=$((COUNT+1))

echo "  [277/549] Would restore: Chapman Heating and Cooling"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='1701ade28dd00029e94d19dffc58ad51c671f2198269ea6de76fbade9ca48263';
COUNT=$((COUNT+1))

echo "  [278/549] Would restore: One Choice Mechanical"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='68e8af5da350ba5e3af31f14f72493b35a809fde092f4c6e42b7784d527527a8';
COUNT=$((COUNT+1))

echo "  [279/549] Would restore: Aire Serv of Louisville"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='64f62d8f338e77159224d20f06d47aaaad3214ea08ce4b61061daf762866d45e';
COUNT=$((COUNT+1))

echo "  [280/549] Would restore: Ross Electric Company"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='3693d3cbc2b66f0f4d069bbaab3d5a777c107885c277860902b9c38a99542408';
COUNT=$((COUNT+1))

echo "  [281/549] Would restore: Excalibur Electrician of Memphis TN"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='0cf81d7f29ef74e5c892d8c4dedf2a840e66ee514b27ea6bf62757907c13257a';
COUNT=$((COUNT+1))

echo "  [282/549] Would restore: Schwartz Electric Co. Inc."
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='ed5aa9361743c3e2984a3558923e024c6cc95a1d2949285f93c8fb04ca92408d';
COUNT=$((COUNT+1))

echo "  [283/549] Would restore: Roof Pro LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='3c683af0d3a8f0371c357b19f12fb8864fb8f3e7772dc40f847fb85829b2a6c1';
COUNT=$((COUNT+1))

echo "  [284/549] Would restore: Restoration Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='100e81df82f575cb9f1f2133ace5b7dfc638bab8902d2b090429d35f56388409';
COUNT=$((COUNT+1))

echo "  [285/549] Would restore: K&M Roofing & Exteriors"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='f434e82a61113381c30ae86be087435cdcbf758991b23cfc175d5ed27eb925e1';
COUNT=$((COUNT+1))

echo "  [286/549] Would restore: Elite Roofing Solutions"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='caeb311ae09524c28f1de5c2b7f6ef679c86a9c667ccbe5c78723edca4ec8988';
COUNT=$((COUNT+1))

echo "  [287/549] Would restore: Cool Roofs - Memphis"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='39fc77791deb5a7473aceb779df6a5017e8303d646df7d237b5f117aa294f4a8';
COUNT=$((COUNT+1))

echo "  [288/549] Would restore: National Economy Plumbers"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='4eac0b31aa0ddbb495b2e78265ce5d2273d725293807be81bf07eeeb0dd82f15';
COUNT=$((COUNT+1))

echo "  [289/549] Would restore: Avantel Plumber of Memphis TN"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='aa806371cdb1226da06d2b57e0af679f83460d56c03d98adc93105dc68905b5b';
COUNT=$((COUNT+1))

echo "  [290/549] Would restore: Traditional Plumbing Co Inc"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='1f900b44e42a16a9abc32977f18ba85916177d1a925ffd03c89efd5136c300de';
COUNT=$((COUNT+1))

echo "  [291/549] Would restore: Premier Plumbing Pros"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='eb06a72d63d8cb0c9b848c01d34c35dd192fd5a2ee3b5ff881589fba7d7345e7';
COUNT=$((COUNT+1))

echo "  [292/549] Would restore: Smith'\''s Plumbing, Heating & Air"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='b051a441fb2f12210890b4b78c30130009c3769e256f5bfb91382451b4e38782';
COUNT=$((COUNT+1))

echo "  [293/549] Would restore: Choate'\''s Air Conditioning, Heating, Plumbing And Electrical"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='244f2fcf3ea850cf9b33c3bf51dc4350ca480d1150fdaeebab4ab2ea7a45f00a';
COUNT=$((COUNT+1))

echo "  [294/549] Would restore: OPACHS HVAC SERVICES"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='2961eaba2636f26ea4e8e96c5dea97a5c6862afb921e1680808a197d8eb9a38c';
COUNT=$((COUNT+1))

echo "  [295/549] Would restore: Aire Serv of Memphis"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='f39c331db4de92b112e328faf5308eb73ccf5bcdd91e1970dbac5260c6cfd3f5';
COUNT=$((COUNT+1))

echo "  [296/549] Would restore: Choate'\''s Air Conditioning, Heating, Plumbing And Electrical - Memphis"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='cf5db6160fbe08485e4e8cae88661e0d34fb2c9d462c66530fb5d6b7f017526a';
COUNT=$((COUNT+1))

echo "  [297/549] Would restore: Memphis Air Conditioning & Heating"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='adbb9523dd435b07a75d15ee647f7f2b000a847ae9328eb2d40911f1df2b6214';
COUNT=$((COUNT+1))

echo "  [298/549] Would restore: National Electrical"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='6e5039c0ae2f26c1900a26050b4dd249d5f14b391b39570ed588282f1e6e11f3';
COUNT=$((COUNT+1))

echo "  [299/549] Would restore: Residential Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='698a2bee3024f99588ab0486205db36ede2c1bab4cdcc9a1ce9b774bee5a8f73';
COUNT=$((COUNT+1))

echo "  [300/549] Would restore: Jayone electric llc"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='aaed9eb7cb20c987a8603db0b3b819be44ad69820f932050a26e2ca575a11344';
COUNT=$((COUNT+1))

echo "  [301/549] Would restore: Billy'\''s Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='ba92c8e0d0dce5dc1c067c3898a58109257360673e8e457986567544709cf21f';
COUNT=$((COUNT+1))

echo "  [302/549] Would restore: Bruttell Roofing, Inc."
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='7f908d8051d617c23fb26b6bc121f184272e6dc1107b081173220b6eb2ff2c83';
COUNT=$((COUNT+1))

echo "  [303/549] Would restore: Bison Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='fa1bf86b1616bc3a9b356e29ece79726b310df06cb79e63e9acec393bf530832';
COUNT=$((COUNT+1))

echo "  [304/549] Would restore: WAYNE COUNTY HVAC LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='5276bdbff146094897ac6cf8b5a545d24b5e7c82e0fb50bff81a82f82a9a24b7';
COUNT=$((COUNT+1))

echo "  [305/549] Would restore: Touchstone Electric Raleigh"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='24eab590a91c2839ab13ff3913d4011af3053c2fb0cfdad2e2301e0f1ba71814';
COUNT=$((COUNT+1))

echo "  [306/549] Would restore: ELECTRIC ALL PRO"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='88716c218e477afbe37560e963f5b8021b7720cb6873c17ce9e0ef026a102e7a';
COUNT=$((COUNT+1))

echo "  [307/549] Would restore: Express Electrical Service"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='cf87ed6fbd8593ff8ba5b45233ca0028c678894a48703db159e3172144e2f31d';
COUNT=$((COUNT+1))

echo "  [308/549] Would restore: Simple Construction Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='c2a40f4b818e2994c8b328262ffff65819739becdfbd92a5d05366f199f4394e';
COUNT=$((COUNT+1))

echo "  [309/549] Would restore: Roof Dawgs"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='189b031a169f76e2079c67068a7b77abe72dca05c528f942c4859b1cb47c523a';
COUNT=$((COUNT+1))

echo "  [310/549] Would restore: Dana Dean Roofing Company"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='a2dd5cee99e0553191b4d92fca0a978121e44317d4d2b6f81e00d3662ed7e4d8';
COUNT=$((COUNT+1))

echo "  [311/549] Would restore: Roofwerks, Inc."
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='407dd273d6a5db968837637c0f4d68af34096921ee978b83caf5f464c6ef16b8';
COUNT=$((COUNT+1))

echo "  [312/549] Would restore: Southern Premier Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='e088e835aedb3871bddbbee26ac8418f3ba37ae99780a5bac0b73b812e983b12';
COUNT=$((COUNT+1))

echo "  [313/549] Would restore: Raleigh Roofers LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='eb01824aed9e58f9766a218fb39d6210ccb7edc4f389bd06e0183904f1645079';
COUNT=$((COUNT+1))

echo "  [314/549] Would restore: J. R. Lane Plumbing Co."
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='ee46a45f76ace4ad0667f6739613e7f94e14f3fa47764de025b53ed5499b7249';
COUNT=$((COUNT+1))

echo "  [315/549] Would restore: Optimal Plumbing Solutions, Inc."
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='2c128aa581ab45cfbc40f3433c0e98aff820f7fb61178482c1811535b45a33f0';
COUNT=$((COUNT+1))

echo "  [316/549] Would restore: Godby Heating Plumbing Electrical"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='8f9149bbcdd8711f1426d50bb2aaeaeb97d7c602e0611ddae8ee4faf5b72b25b';
COUNT=$((COUNT+1))

echo "  [317/549] Would restore: Zimmerman Electric Indy"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='f5c15e96745313da5c94dcd3607f78ed42e1abe8d120fac1fbffee230c5e6064';
COUNT=$((COUNT+1))

echo "  [318/549] Would restore: DAVID-ELECTRIC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='a58053a19e9c086d4c20f304653c45b2e0d6a3507edb0f64b8cdc16f5248a3d7';
COUNT=$((COUNT+1))

echo "  [319/549] Would restore: WaterTight Roofing Indy"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='02086a24fb78ff256e18c382d69543bf83c816dee05433b41ae58df50d5b8e03';
COUNT=$((COUNT+1))

echo "  [320/549] Would restore: Trojan Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='ca8305aaeb3babb71f406e542d12cec70f4d513655e5bdc0163e5bd25703bac1';
COUNT=$((COUNT+1))

echo "  [321/549] Would restore: Two Brothers Roofing Inc"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='32a99977500d6c45034b4d3e3816a992aea594fe4907c1ed7001e361438a7cc2';
COUNT=$((COUNT+1))

echo "  [322/549] Would restore: Raptor Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='d222d211b0cec850d73f4d11b7431f615a6543360a5caaf6f0643f466239361e';
COUNT=$((COUNT+1))

echo "  [323/549] Would restore: Indianapolis Roofing LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='27e8d314d359d46cc738ac10d741a01a5917dc0bd53cfa8f637ea0843eb97319';
COUNT=$((COUNT+1))

echo "  [324/549] Would restore: Stay Dry Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='0ef80ded04eed8ae546dee9c31490990572463a74f1db3d29d3b5b6f3eb75ca3';
COUNT=$((COUNT+1))

echo "  [325/549] Would restore: Indy Rooftops - Roofing Replacement Contractor"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='fbc1206d9f37199be99cab3b6ba05d405a0599e8d4d44441b52924bc3816b888';
COUNT=$((COUNT+1))

echo "  [326/549] Would restore: Bone Dry Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='423b309fb59eca8db8a9c27f1565472deaaeb62b55f56d086d57f91740e1aa71';
COUNT=$((COUNT+1))

echo "  [327/549] Would restore: Indy Roof & Restoration"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='b3d40afade067c9015dbb4383c812bd2ce5e979bf776eae881323d0a920b7f09';
COUNT=$((COUNT+1))

echo "  [328/549] Would restore: Plumbing Heating & Air Conditioning Paramedics"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='9eb25ef58584b80d07a7f9c0fe768e7a5df6973d3996a5ff898375e0415a2aa0';
COUNT=$((COUNT+1))

echo "  [329/549] Would restore: Carter'\''s My Plumber"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='8ab94d4f67d4ad986ae76bb0278fb6e1f62ecfe185af28c4e4629b7ddfd8848b';
COUNT=$((COUNT+1))

echo "  [330/549] Would restore: Carter'\''s My Plumber - Drain Cleaning Indianapolis & Sewer Line Repair"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='c76f7656565c4461b957f0d478aabc9a4b852f2f1e8e055df026f5b7e6c677ea';
COUNT=$((COUNT+1))

echo "  [331/549] Would restore: All Pro Heating, Air and Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='9ef06647c26f077bc32374900629b980f9c8fdc1231bba69912033706034c075';
COUNT=$((COUNT+1))

echo "  [332/549] Would restore: Northern Comfort Systems"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='366a733398b42734dac1cfafc1395d5d06ddc0d1d9386cb63acafa24f5aac9d6';
COUNT=$((COUNT+1))

echo "  [333/549] Would restore: Roy Rogers Heating & Air"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='eb13f9d5c5f60f2f2b40a9ab6d0097b979f90923cc4ebcad08b99a36b3edf83b';
COUNT=$((COUNT+1))

echo "  [334/549] Would restore: LCS Heating and Cooling"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='0d6d4d54674b95f4faea701af4ca7b00f7cc155e504c2d8617f612d4ae22c3de';
COUNT=$((COUNT+1))

echo "  [335/549] Would restore: Care Electric LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='f68ccab27ebc5f5e8f2020da8ac2b3993036d5f11b48b76751eddb7ef4ff9311';
COUNT=$((COUNT+1))

echo "  [336/549] Would restore: R & T Yoder Electric, Inc - Central Columbus"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='44f47d8810fdfdc6746b3f5103bbd7047e9a5e21b210fc4cd8a2f7d011d1295b';
COUNT=$((COUNT+1))

echo "  [337/549] Would restore: Buckeye Electric of Upper Arlington"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='0d5fc559804986b26e406b2a08678fb4083a06201479570a7fa382538f896f9b';
COUNT=$((COUNT+1))

echo "  [338/549] Would restore: Right Way Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='320381ada33f4c7e6a193ae46e3b99effe76f60809b54847c56155be3021e7d0';
COUNT=$((COUNT+1))

echo "  [339/549] Would restore: Mighty Dog Roofing of Columbus West"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='d284dd729b7f58e867e56175707f42b909208d942c968322f66969995b15c693';
COUNT=$((COUNT+1))

echo "  [340/549] Would restore: Roof Revivers"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='16a6cd9a78f7f814b43c4eb7e7fe45f6fdd8d59ebc064d69a771f65ed278f2d8';
COUNT=$((COUNT+1))

echo "  [341/549] Would restore: Able Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='4fb3a7537a48bdfd8beaf5f2dc5e9112f6b20f9f0cfc40522ba6c83f8ba025c4';
COUNT=$((COUNT+1))

echo "  [342/549] Would restore: Columbus Roofing Company"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='ce9b43f37fd9c1c18d90067e55483b47902d4f6288dadb8c5a61dd3b4a6cb6f0';
COUNT=$((COUNT+1))

echo "  [343/549] Would restore: Transit & Flow Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='5360a5795159bbe9d284e849e8aca84a5e70ceba42b7b7a2f326d869bf790afd';
COUNT=$((COUNT+1))

echo "  [344/549] Would restore: Northland Heating & Air Conditioning"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='6901bf18832c9eb33e94b77d59c770c62f2d8ec1642398bbfe27815bd2c7114b';
COUNT=$((COUNT+1))

echo "  [345/549] Would restore: Hetter Heating & Cooling"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='11ef62940cf3a4508a269c1430f74ddbfbbeabb81277383f317454140906f63c';
COUNT=$((COUNT+1))

echo "  [346/549] Would restore: Groves Electric, Inc."
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='3b6569686d42772ac3c4fc6f8e6b1008d00e57d2911d4e11612c01937ef0a578';
COUNT=$((COUNT+1))

echo "  [347/549] Would restore: Aguila Electrical Services Inc"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='a504a693c8a13e8b4aa8696edfae53f0b5bef9ccac362c403c3f2df25d504194';
COUNT=$((COUNT+1))

echo "  [348/549] Would restore: Acme Electrical Services"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='07fbe2dd48973d48aa413b46cbe9c26c4d5a33a9db3e80804951a16e0d2bb212';
COUNT=$((COUNT+1))

echo "  [349/549] Would restore: Five Star Roofing and Construction, Inc."
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='f7d030adc304c8af0443b243b53da6eec2762d878fe13c4a14b618bc6e275457';
COUNT=$((COUNT+1))

echo "  [350/549] Would restore: Evans Roofing of Tampa Bay"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='0a9af16c876eccf26a4e7bd076aa54aaf84e06363c3cb1ea51391cad0cc17e27';
COUNT=$((COUNT+1))

echo "  [351/549] Would restore: The Roofing Company"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='9a1c8bc2dfc69dfe1a10b7089262ddb8b0238079de9be1ec1d288afbcbad143e';
COUNT=$((COUNT+1))

echo "  [352/549] Would restore: SCM Roofing, LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='1eea3866f323b085bab314efd3d6c28b9c89c5fcc900bf97e89f9ca591f1f7bd';
COUNT=$((COUNT+1))

echo "  [353/549] Would restore: Fix Roofing LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='79be257de68b6feac3bebf81fc3e56e8c9622edaec2320e7330d24b50c078b35';
COUNT=$((COUNT+1))

echo "  [354/549] Would restore: ROOF PANDA LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='5aebb7f86587139454f9d3d5addccaba38b0c8a0f12e533102f64ec83f8dd6c5';
COUNT=$((COUNT+1))

echo "  [355/549] Would restore: Mr. Rooter Plumbing of Tampa"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='7db276d0ef58ca243e1b6df1cd2947db07839d21d2a831a5295675bd0a28e096';
COUNT=$((COUNT+1))

echo "  [356/549] Would restore: Rolando'\''s H.V.A.C."
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='6380f474d8b51c1c4dd7f3e117ebfae61a26fc88446d4d1e6ad9676451aefe34';
COUNT=$((COUNT+1))

echo "  [357/549] Would restore: The Comfort Authority"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='8c0043d0b72570b88c0992888271dbaa22ab41731ef9dd020c25440166e6fdec';
COUNT=$((COUNT+1))

echo "  [358/549] Would restore: Nominal Voltage Contractors"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='e23ebebf1373249b135762bd0319cbd5b90ea6a317503b9a77f54c0fcc66eda7';
COUNT=$((COUNT+1))

echo "  [359/549] Would restore: Sky Light Roofing Inc."
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='ea91649e81c1f362367940cd0266243bf802e306a4e5b4a324cf8e011b87193e';
COUNT=$((COUNT+1))

echo "  [360/549] Would restore: Orlando Roof Tech"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='90dbd364bf9ca9ab485b7600fb6430962ecc93700a0a5eb25697f92fb89964d3';
COUNT=$((COUNT+1))

echo "  [361/549] Would restore: New Standard Roofing Orlando"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='fb31e00e22ceec3bbb7b56aeb94fef39ca470662bf65d1ae5f50c243c7696af6';
COUNT=$((COUNT+1))

echo "  [362/549] Would restore: Schick Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='cb2bac8bde57dbdaa3db48fa23276fb543974869fe0ae0d60f74e7a78d53adb0';
COUNT=$((COUNT+1))

echo "  [363/549] Would restore: Orlando Roofing Company"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='fea1d1ce9fbbd9f63438508cb61763ac622587c7b3cb9553f26c83a822f0bb5c';
COUNT=$((COUNT+1))

echo "  [364/549] Would restore: Next Level Roofers"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='79e03c1be8ed16fa6450d76655c4adecb2427d0d6c181346b1e3c93efb34b9c1';
COUNT=$((COUNT+1))

echo "  [365/549] Would restore: Gold Key Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='60628e682bf589be79e0dd993c02dcbc319876f87d3d01db876e4e8799698fa5';
COUNT=$((COUNT+1))

echo "  [366/549] Would restore: Gravity Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='77e80e405fab83409ef19d14006bc3fe110598c5a31fd6b64ccb1ab7c9943806';
COUNT=$((COUNT+1))

echo "  [367/549] Would restore: Modern Plumbing Industries, Inc."
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='0536cd2f8826855c8be08ef62ac89287926de88b36900f0abf72661af671d24c';
COUNT=$((COUNT+1))

echo "  [368/549] Would restore: Frank Gay Services"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='88b77a1a6d29b2a230021071a603585ed3139501db85c8fa16991cc2cff5b634';
COUNT=$((COUNT+1))

echo "  [369/549] Would restore: Bob Heinmiller Air Conditioning Inc"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='cbd588c9bae62c9440f46f651889861e912be836291e4703c571ed272dba7691';
COUNT=$((COUNT+1))

echo "  [370/549] Would restore: Our Place Air & Home Repair"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='f80d1f2bb99fa27f7c4fc4fde3ef26e14b732a67b60aa718d4bbc3031b537451';
COUNT=$((COUNT+1))

echo "  [371/549] Would restore: Excalibur Electrician"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='c6f9021adc86224b280a93e3cc6e47a05e95228ea6118a13b6eefb0a48bc9586';
COUNT=$((COUNT+1))

echo "  [372/549] Would restore: Hometown Pro Nashville Electrician"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='6a363e21d20df896b9e0dfdfc7777d4c2719fbfdab6b2ebeffbfd03b8400c7a4';
COUNT=$((COUNT+1))

echo "  [373/549] Would restore: Nashville Roofing Company"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='cee5a4d1e66b8c47932ee32fa14574799cb392c94844fa53f95b86d271e6b95e';
COUNT=$((COUNT+1))

echo "  [374/549] Would restore: Southern Roofing Co."
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='80fb6e84e4660172eedac48039000bc1329ef4505e766b5edc3e3b45836f852c';
COUNT=$((COUNT+1))

echo "  [375/549] Would restore: Holt Plumbing Company"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='cac814e33a89c642ce04d89cf9cd2a73020b0913349d978d361ec1c7226f1b49';
COUNT=$((COUNT+1))

echo "  [376/549] Would restore: 1-Tom-Plumber"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='7a4b660dc13512de273eba5053a4ae6c99e2485816f90816ad288a42ef9adc96';
COUNT=$((COUNT+1))

echo "  [377/549] Would restore: Air Conditioning Service, Inc"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='6d849dba79e7f8ef50daef919b0fd91cfbb029ed90ba3da5725369f48a73d2ef';
COUNT=$((COUNT+1))

echo "  [378/549] Would restore: Mr. Electric of Charlotte Metro"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='7300e7673db9054731debc1f571c7be68f73cfaca6f7f8c8c769dd5ad86e729d';
COUNT=$((COUNT+1))

echo "  [379/549] Would restore: Charlotte Ace Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='e0c625aea8e2fb5c5bf6fb6ac3827d523bfd9943ce09df281e851b1519c92e9c';
COUNT=$((COUNT+1))

echo "  [380/549] Would restore: Ross & Witmer Heating & Air Conditioning"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='ff3f577a04dd9dc8deb65a2ea003bd9dafce004de4f11dec04d7518e622746a8';
COUNT=$((COUNT+1))

echo "  [381/549] Would restore: Charlotte Heating & Air"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='4ae4f74ecb6ca7803dc8e395fd66412ce007e7c387bd0c2d92da7076f0c09950';
COUNT=$((COUNT+1))

echo "  [382/549] Would restore: Capital City Electrical Services, LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='887b066c868ab4c3ea1ea5a51cee9856d36dda69a5d18be093b7d705c5d715f8';
COUNT=$((COUNT+1))

echo "  [383/549] Would restore: Mosaic Roofing Company LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='63715ed39e6dd906e36c14b8ca58c817443835de8b0ae0110e0ac404c1988739';
COUNT=$((COUNT+1))

echo "  [384/549] Would restore: Bell Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='92ad8bf7a7e1942f29bc2c43c0fecfb20ea93fcfac4a7ac2558e72216070a218';
COUNT=$((COUNT+1))

echo "  [385/549] Would restore: Castle Roofing Atlanta, GA"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='87c75c3f41c0cd81872e42ce293ad4fb0104ac5d13617f321038b35f33e08469';
COUNT=$((COUNT+1))

echo "  [386/549] Would restore: Peach Plumbing & Drain Atlanta Plumber"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='145772a879bdf4e73902387040e54a644490f57aa6e36a0f74a9b9c4dc3ec975';
COUNT=$((COUNT+1))

echo "  [387/549] Would restore: Reliable Heating & Air, Plumbing and Electrical - Kennesaw"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='e9045dee85d7a21004b6d6b515103c1455409e079529603a1fcf3ded69253956';
COUNT=$((COUNT+1))

echo "  [388/549] Would restore: PV Heating, Cooling & Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='fa674552e273c7b8c5dc794aac109b2a95ba24fb4df468f25731b2aa0d37480f';
COUNT=$((COUNT+1))

echo "  [389/549] Would restore: Callahan Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='39ddbf697fa50abcc7d1ecccab75861f3a0ebcee5799ae1523f905e7cee97b9f';
COUNT=$((COUNT+1))

echo "  [390/549] Would restore: Geek Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='f23487551c3e32899e4b191d3835d1112404638313099df8c6e7a68405dfa764';
COUNT=$((COUNT+1))

echo "  [391/549] Would restore: Henco Plumbing Services"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='978314346818de114e995cb1382be26c57000b44d01fa7854d709a54105fcb7b';
COUNT=$((COUNT+1))

echo "  [392/549] Would restore: Plumbing and Sewer Renewal Specialists"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='f4288942390008b811cef54f568d65d0c3f3bfb168fdf0dd5294b12b59aad9f0';
COUNT=$((COUNT+1))

echo "  [393/549] Would restore: Cornel'\''s Plumbing, Heating & Air Conditioning"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='9135b105b7f9a373a7c29b183abd466d1e6f848b5d7f181ef6f58c51ec3f3076';
COUNT=$((COUNT+1))

echo "  [394/549] Would restore: Perfect Service Plumbing and Drain Cleaning"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='10b7e4bcbf4569bb3d11398d5f86cc82adb5b660ef0dc026a9fe241690f0908a';
COUNT=$((COUNT+1))

echo "  [395/549] Would restore: Efficiency Heating & Cooling"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='a6ae369dda1d97b36677f761372f308c948f4577fedef17b46f2bc05ecd420c8';
COUNT=$((COUNT+1))

echo "  [396/549] Would restore: Central Air Heating, Cooling & Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='e48da029672f20c9da2a13de4404ecc78d5c5fecad3fd86a6d083db0ceb62554';
COUNT=$((COUNT+1))

echo "  [397/549] Would restore: Sky Heating, AC, Plumbing & Electrical"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='4ce09c8423d2fd05f34927113cd60d490bccf70f55d6dbab1073916b0dd3a11b';
COUNT=$((COUNT+1))

echo "  [398/549] Would restore: Sunset Heating & Cooling"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='7374474e4d427324520feb7e764ffcc7616ef49de83cacc20985889486d9bc73';
COUNT=$((COUNT+1))

echo "  [399/549] Would restore: In-House Electrical Services"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='9d0303139f215fd5b11d68eda39a03ee054d4eb4072a1137358d247250107c4c';
COUNT=$((COUNT+1))

echo "  [400/549] Would restore: Tekline Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='62f2a8b19820e28f4d4611a6de29725562304cdf37d2597e0503872aeb7b53ac';
COUNT=$((COUNT+1))

echo "  [401/549] Would restore: Forever Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='3d0a4e9017d7d2e8b83f8c3f800046a4b36e0a6455a70d3e2ad7f28b218830a2';
COUNT=$((COUNT+1))

echo "  [402/549] Would restore: NearMe Roofing Company"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='34a762885ec95ef6340a14ba7c94842c825076fda650ac112ac51b8347beddbf';
COUNT=$((COUNT+1))

echo "  [403/549] Would restore: Anthony'\''s Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='55e1a13db127d014c4c4c05da421b07a00a9a6732f895736cec51162b46a4838';
COUNT=$((COUNT+1))

echo "  [404/549] Would restore: Mr. Rooter Plumbing of Seattle"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='36bfa89d8d0a5e9090515583b01d56b55749a2110e00c2ac7ea974ee03c3b406';
COUNT=$((COUNT+1))

echo "  [405/549] Would restore: Eco Electric, Plumbing, Heating and Air"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='4fa9fbf252f8797e572ccb66a2529ae3955b5b5842215baed08d20121e276949';
COUNT=$((COUNT+1))

echo "  [406/549] Would restore: Greenwood Heating and Home Services"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='9828bcecfb870671420675502d815ec84da28ed8a563cba749896861b01d071c';
COUNT=$((COUNT+1))

echo "  [407/549] Would restore: The Electricians"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='6b9c6971a6ad31192bc3d4b8b53cf024ce8cb18fa4a5230f3dcc1f88babc1096';
COUNT=$((COUNT+1))

echo "  [408/549] Would restore: JM Electric Inc."
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='550443c7a9b44eefdd83fb8133d625e528db8e4243a04088a49afd0bb4579736';
COUNT=$((COUNT+1))

echo "  [409/549] Would restore: Denver Electricians"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='2f54cfa152a0f318b7451d5e24b941639a3c08edf44249cf38fce49d33e85f07';
COUNT=$((COUNT+1))

echo "  [410/549] Would restore: Formula Roofing and Remodeling"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='eb809d21727407d0891036fe41ca75851f2c49fc5cc576d626aa7c7923dded37';
COUNT=$((COUNT+1))

echo "  [411/549] Would restore: Speed plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='307b1b9af11aecf6c8f29203331cebab07ecf6068dcf7f146e868fa7a00b57bc';
COUNT=$((COUNT+1))

echo "  [412/549] Would restore: Squeaks Services Plumbing Heating & Air - Denver"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='e29f5bc2a63cc593a9ec4bfa70cd9249270d7d8ed9663229991c958e4d762527';
COUNT=$((COUNT+1))

echo "  [413/549] Would restore: Absolute Plumbing, Electrical, Heating & Air"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='0c7c5f3fa3dca89ad276cf69742848d59819f17628d262e3d3a36a34b1767d06';
COUNT=$((COUNT+1))

echo "  [414/549] Would restore: Right Away Heating"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='6dc3bee907b0cb20b06719811f103268374087798f897a210378fbd12135a5b6';
COUNT=$((COUNT+1))

echo "  [415/549] Would restore: E&P Electrical services"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='066b08e85b3672385546790db5c01a71f06af47170162463e4585ae43344ad79';
COUNT=$((COUNT+1))

echo "  [416/549] Would restore: Mainland Roofing Company"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='1da28b75e261c12fc5526d98d44019dd101bb1aafeac19b10285d6d357d99f00';
COUNT=$((COUNT+1))

echo "  [417/549] Would restore: 4EVER ROOFING"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='ec839fdb1c0d728bb56423302e25334f7c830c538c2c705b6632a0f932a63a29';
COUNT=$((COUNT+1))

echo "  [418/549] Would restore: Fix Up Roofing and Construction LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='f08f446d4f971179bff9ea70a7c8bad4bb4f08d8db07724d774b8e3f93b67732';
COUNT=$((COUNT+1))

echo "  [419/549] Would restore: T&S Roofing Systems"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='c5b5adf3191d319c65e01c303cbcfe22f331f408fbcb4c455d2658dad245d254';
COUNT=$((COUNT+1))

echo "  [420/549] Would restore: Miami 305 Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='fb40fa4f29212c15e2094d55f5d9d278b096900ece67d4d6db28c509cdde6a46';
COUNT=$((COUNT+1))

echo "  [421/549] Would restore: Hernandez Plumbing Co."
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='291f9d92de0455d2a90fefee4e25b63dd7f6f795303958ed604a8c005f68dcd9';
COUNT=$((COUNT+1))

echo "  [422/549] Would restore: Ez Plumbing Repair Services"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='b7619ef2408c47ebaeb73662c58300c4488257eec1c66959b8b0d07fd3d90ff3';
COUNT=$((COUNT+1))

echo "  [423/549] Would restore: Oasis Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='7282073de70a44ffc9f6379c1adab146ab501fb0c4e78a6800e643314cf3a589';
COUNT=$((COUNT+1))

echo "  [424/549] Would restore: Sunny Bliss Plumbing & Air"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='dd867519d9d54edf1c1d3ab503d48fe9fbd2aa6937bba7faf771ee1e79d67e36';
COUNT=$((COUNT+1))

echo "  [425/549] Would restore: Miami Dade Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='86319c0bc2a8c496313c212717baa2cf943f4112abe49d4b5a5c60d9da6dcfb0';
COUNT=$((COUNT+1))

echo "  [426/549] Would restore: Miami 24/7 Plumbing - Miami Emergency Plumbers"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='9bbb2b65fb6b5dce306ce5ecf1d6f8128b3c73bf2e0564f6c7cee98360538782';
COUNT=$((COUNT+1))

echo "  [427/549] Would restore: Emergency AC Corp"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='d8f03f0d491f19b6e2f6425493922d618663c7c6e51a2f82a3ffb365b881ddf3';
COUNT=$((COUNT+1))

echo "  [428/549] Would restore: AC Repair 24 Seven by Cooling Masters"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='2f3702c5ef3d420ada3edca6182a6e1b13313ffbe8ac87796e73860aacf669e5';
COUNT=$((COUNT+1))

echo "  [429/549] Would restore: Freezing Mechanical"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='5d5ea386f0096eb596b1870818d3f1634a377f6ad8c0ab9e7d6f2b9524981795';
COUNT=$((COUNT+1))

echo "  [430/549] Would restore: Doctor Air Hvac Corp"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='3a90477f34e5d4059798b95cf68a853a96bd0d2f642802a294dd6fe584e6cdf9';
COUNT=$((COUNT+1))

echo "  [431/549] Would restore: Flavin Electric LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='2c10c256575a2a0bfa87aacdc9494077543384d0593681dec72f5fa1573a84b2';
COUNT=$((COUNT+1))

echo "  [432/549] Would restore: Loboz Electrical"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='d8f0d4f453712f098e96d1a179b10e32f5079b0ef41e45dab4b8a6d0aefa8df2';
COUNT=$((COUNT+1))

echo "  [433/549] Would restore: Midwest Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='9be8b7cb597e8077951083ce837fd0be24c75eeccf63ec37acd5fefa12dfe2f5';
COUNT=$((COUNT+1))

echo "  [434/549] Would restore: Perez Roofing & Masonry"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='c22880a453594a17ba3c9461d36cb73f85ec691f511e6846176ce1965abc05e5';
COUNT=$((COUNT+1))

echo "  [435/549] Would restore: Global Heating and Cooling LLC | HVAC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='ad49e79f2005641d5ae896e2aa533de97e4685b0ed6a6b83993de5b21f11d799';
COUNT=$((COUNT+1))

echo "  [436/549] Would restore: Vale City Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='b42b470cf4157c8ea375aa01d51b6f61660a92426188045ff14f07e733d91071';
COUNT=$((COUNT+1))

echo "  [437/549] Would restore: Coppertown Electric LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='44ae88cfd61a9be6a82a6c56199b9bd071f3751fae7c8ec4fb24994dab837f78';
COUNT=$((COUNT+1))

echo "  [438/549] Would restore: Star Light Electric LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='e4fe975df4967e09f5ebd4e7cd5ebc0812c8e25a0db966a22ff74f12895a0a29';
COUNT=$((COUNT+1))

echo "  [439/549] Would restore: The Aussie Plumber"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='52e07b47bd5d06de49d2cd90e3d60af57e5126e8f72be0de1830ec0ff174e979';
COUNT=$((COUNT+1))

echo "  [440/549] Would restore: APES HVAC & Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='24aa813f8718cd3aba99372db24a22d290e97591974525bbf0196624b512d911';
COUNT=$((COUNT+1))

echo "  [441/549] Would restore: North Valley Mechanical HVAC & Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='3bec2959f6a03f00081b11ab291846d2553fabc52c68718379ea64dd600cf70d';
COUNT=$((COUNT+1))

echo "  [442/549] Would restore: Matthew Lorand Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='560b02c7fa50f73059bead8460a5f2182f322e5d440dc6e9141c517b22668722';
COUNT=$((COUNT+1))

echo "  [443/549] Would restore: Kidd Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='ef8ec75f12267ba6033323bb74d776bf53c1e4dca553de45d3335b26ea3af34a';
COUNT=$((COUNT+1))

echo "  [444/549] Would restore: Wilson Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='02609cedc85c996270ec85dbf1dd6477c78e4ae5546f89ac380c8924e43beaa1';
COUNT=$((COUNT+1))

echo "  [445/549] Would restore: Apex Roofing & General Contractors"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='831632326da371acb0eded6fe05fc988e81174e600acf7118bb339b6847d7563';
COUNT=$((COUNT+1))

echo "  [446/549] Would restore: Premier Roofing and Contracting"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='aba583a80254472925cb53fe8a9d1be17339366139e44b200826d82924fc9c90';
COUNT=$((COUNT+1))

echo "  [447/549] Would restore: Reliant Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='0870f1a181ce65012608fabbc6315cd655642c026b8a6740320b79cbfe8b519a';
COUNT=$((COUNT+1))

echo "  [448/549] Would restore: PlumbSmart"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='6f1256dbfcfaf54de30bdf3d06bd4ad1883b4c0b465352a969a7371ed1b80f90';
COUNT=$((COUNT+1))

echo "  [449/549] Would restore: ReliaBee Air Electric Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='b9892d204e0cbc4a200bdbe8b1101c0be88e66d3e73f89b58683e994f288da8d';
COUNT=$((COUNT+1))

echo "  [450/549] Would restore: All About Air Conditioning & Heating LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='391b294a0a707830577cea9e1c27bc2617673a18aeead0a42fe5311c83095262';
COUNT=$((COUNT+1))

echo "  [451/549] Would restore: W3 Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='a34ffacdcd0f5f0c3f51efe6e5c36c971767948deb69f5241cf1cf496effb560';
COUNT=$((COUNT+1))

echo "  [452/549] Would restore: Knox Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='fdfb43a52291cc3b44c776b4c82e53b066e2b265714afc964cdfb01c3f14bd36';
COUNT=$((COUNT+1))

echo "  [453/549] Would restore: Sunshine Roofing & Remodeling"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='6e0ec2f95f88951d74b98152067a2f8f6f271b86cd761805305553169ed8bb17';
COUNT=$((COUNT+1))

echo "  [454/549] Would restore: Reveles Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='2a87980ebd1be223de75db706011c7a0eb0e9bb25dfd3bd363c9c0e421778382';
COUNT=$((COUNT+1))

echo "  [455/549] Would restore: Bold Roofing - DFW'\''s Best Roofing Contractor"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='5deaaa853d4dbb7923120aec5ce2588c8ef9f4e6c7cf0b09754d14791a8ba1c7';
COUNT=$((COUNT+1))

echo "  [456/549] Would restore: Blue Hammer Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='080f485ffdd248d573146f8bf35dc622aa8c6bdc894dcf7ed96027edec11c484';
COUNT=$((COUNT+1))

echo "  [457/549] Would restore: Priority Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='7217051bf73e9a4c85141899ca8c03b70497f4fb96be42a084491b18135b6401';
COUNT=$((COUNT+1))

echo "  [458/549] Would restore: Arrington Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='3572216d431829ab6450e3611c527671ea399c3386007dc176945c6677cb3cfe';
COUNT=$((COUNT+1))

echo "  [459/549] Would restore: T Rock Roofing & Contracting"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='1743a8a2bb747926280529b7a3547b7a35f95a1c6a51ae5af76fda7b3d51b2bc';
COUNT=$((COUNT+1))

echo "  [460/549] Would restore: New View Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='08a41bca499533bb6c6ba4b6da1a98856ac8cb32456c7b6a0a984bc7eca6b233';
COUNT=$((COUNT+1))

echo "  [461/549] Would restore: Cody & Sons Plumbing, Heating & Air"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='a59d3dfaca375a270a78c081a5faf4ace9b8607761030e3f978a0113cc788f0f';
COUNT=$((COUNT+1))

echo "  [462/549] Would restore: Legacy Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='44eebe02a2775f26fd2814c138a57631231800fa0a9feb322f330bba5cf607ec';
COUNT=$((COUNT+1))

echo "  [463/549] Would restore: Mother Modern Plumbing, Sewer & Drain"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='566ffbcc6ad0690bb56179e1cf0fa72b8b5e4cada8ec31d46ea577b0e10a73c8';
COUNT=$((COUNT+1))

echo "  [464/549] Would restore: Baker Brothers Plumbing, Air & Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='db712729c6d93285e2339c6f7b6073698092a3cc4d713077cb9fa0f5deb5bedf';
COUNT=$((COUNT+1))

echo "  [465/549] Would restore: Tribeca Plumbing, Inc."
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='82b19a62183ee3453ca1e3a3bba3d4c1d31e9cc44986398151b8a4821f838a93';
COUNT=$((COUNT+1))

echo "  [466/549] Would restore: Metro Air Conditioning Heating & Services"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='75f4d3a98445dfa751ebb70099b34d2cbf443c7a53c66c9e0405e69f5ed15003';
COUNT=$((COUNT+1))

echo "  [467/549] Would restore: Astar Air Conditioning, Plumbing & Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='464c83a378fefd1c08db8dbc2420249be7ff9713e4503d2326970ed7c4d8336d';
COUNT=$((COUNT+1))

echo "  [468/549] Would restore: Rescue Air and Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='2a821e1a522f98e7e4e1609ab28ddeb72c12fda0bce27b795b925303d37e4bef';
COUNT=$((COUNT+1))

echo "  [469/549] Would restore: Harlen Johnson HVAC, Plumbing & Electrical"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='ec81bcf5dac51ca2eddfc9ac5f91fa841e9b7ac00ef9a28790d854cc20ec7be4';
COUNT=$((COUNT+1))

echo "  [470/549] Would restore: Electrical Masters Company Inc."
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='d49ea9b5ea389aece3312d3328ad08aa152b29470681a7d3da4f66728c2c372c';
COUNT=$((COUNT+1))

echo "  [471/549] Would restore: Right Touch Electrical"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='330ea47d04f2c05fb1e3b42bf4b135703ccf78c40cee726069617001724fb1b6';
COUNT=$((COUNT+1))

echo "  [472/549] Would restore: Harvest Electrical Solutions"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='92bd1425cf88c7090d0b2c6016ff48d0311f168133371e8b7630e88337e09dbb';
COUNT=$((COUNT+1))

echo "  [473/549] Would restore: Paul Richard Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='cfbd82b50478001899e9ad857904defa828a1078d30cb1386443984a3672c45d';
COUNT=$((COUNT+1))

echo "  [474/549] Would restore: Rose Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='abb0ebf5aec05cd429d79db6362c47cfc083b9a72e9bf3f889c50da4a69cfd58';
COUNT=$((COUNT+1))

echo "  [475/549] Would restore: M&M Roofing, Siding & Windows"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='8b8c19c10eb55aa33fd5644b18e7ddb8c59eddba8ad90bed6f13db1d04704f41';
COUNT=$((COUNT+1))

echo "  [476/549] Would restore: Precision Roof Crafters, Inc."
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='365d6f1f3b190c9624290f16e1eb56f08d7171bbf0c71588522a3e0597894e38';
COUNT=$((COUNT+1))

echo "  [477/549] Would restore: 314 Roofing Solutions"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='511713efa559eb472ce6034dfee31ee402e3015191ea6da52c2b3db42959254b';
COUNT=$((COUNT+1))

echo "  [478/549] Would restore: Amstill Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='738a9e779264bdfaf779e429c1e7fc651c757255d91be4ea13ee06c1b1c47fc0';
COUNT=$((COUNT+1))

echo "  [479/549] Would restore: Roto-Rooter Plumbing & Water Cleanup"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='1db061ae4b128cb510b0e67bb1aac402784a05fdcbb7fc3f07911d09b6ced4c6';
COUNT=$((COUNT+1))

echo "  [480/549] Would restore: 1-Tom-Plumber"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='5f4e02750f914f1135fbe5588d794c6c45be9fa640cf79a791a8352ff128035e';
COUNT=$((COUNT+1))

echo "  [481/549] Would restore: All The Time Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='875fb77b79be374b542989c56490e6d726f879c6e0a782c0d81cc10ed0514aef';
COUNT=$((COUNT+1))

echo "  [482/549] Would restore: All Around Plumbing LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='c625675318c58380d581b63438c8215104a706866fe67aba73d6469a4363a794';
COUNT=$((COUNT+1))

echo "  [483/549] Would restore: Nick'\''s Plumbing & Air Conditioning"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='29d99cec17c4de322e6dbbd50ab1a13998ce210eca62a65e85cb0b3c9465b298';
COUNT=$((COUNT+1))

echo "  [484/549] Would restore: Village Plumbing, Air & Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='827a95f81f0a5ff35ec0b7099a1f107c8d6a49fbeb18781d066d683d6e09aa26';
COUNT=$((COUNT+1))

echo "  [485/549] Would restore: Air Tech of Humble - Elite Comfort"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='d45178feda8aed193831024e110f68ac1ff3f4994f0757e24776d81c3d7e7a7b';
COUNT=$((COUNT+1))

echo "  [486/549] Would restore: Excel Air"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='d9f7251058a2a779c3bbf8ffd059e106596602adf2aa6f9d2c551e4870d7c93a';
COUNT=$((COUNT+1))

echo "  [487/549] Would restore: The Lee Thompson Co"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='31123d948994cfef26d618c30c6651da6404596b71e17649370633cf844c3b9b';
COUNT=$((COUNT+1))

echo "  [488/549] Would restore: EZ Comfort Air Conditioning & Heating"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='4c3ca1e857a324f616f02d18dd69eedcfef265d9a425db1d60e28bdc0494d9d9';
COUNT=$((COUNT+1))

echo "  [489/549] Would restore: Bellaire Air Conditioning"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='083134687550c88904596591a3e3a90eade803faea790758dd99a7dbdddb6444';
COUNT=$((COUNT+1))

echo "  [490/549] Would restore: Mission Air Conditioning & Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='f4d36a7bd49cd773bbc61c54822af2eaca10736b5d1a7f74cfde95a8ee817868';
COUNT=$((COUNT+1))

echo "  [491/549] Would restore: Mirsky Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='07d87e721c9bc176c0124e6be9d19f97ada8616791cbfbf5499bf7119e597e15';
COUNT=$((COUNT+1))

echo "  [492/549] Would restore: Electric Company of Seattle"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='28282e2c7e97ca93a3c6c57586964cff150b2e6f4452ec8987733f85e8c6a59a';
COUNT=$((COUNT+1))

echo "  [493/549] Would restore: Exact Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='70cc876aaa787132a79620e0165166dde90d2933dc1cd7a8ad75f6e69fe54697';
COUNT=$((COUNT+1))

echo "  [494/549] Would restore: Best Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='bbf234a79d0d0da5f73997ddcadd1903ed2bd0ce45a65a59a7c4f0ceb3f57d38';
COUNT=$((COUNT+1))

echo "  [495/549] Would restore: Gene Johnson Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='c29568505628237e14800508f4b091e32ec66272e7b0b8014c1e008e55b48187';
COUNT=$((COUNT+1))

echo "  [496/549] Would restore: Carter'\''s My Plumber - Plumbers Indianapolis, Water Heater Repair"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='b18b943fee7ebb475c19886475e1ccb5939ad1e378717dfc3d611dd5b00ffeab';
COUNT=$((COUNT+1))

echo "  [497/549] Would restore: Charlotte Roofing Specialists"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='004c9c8d9e5205f2131ac84e1ab2dd622cd801c17d59e3407a4645167f2af374';
COUNT=$((COUNT+1))

echo "  [498/549] Would restore: Mr. Electric of South Charlotte"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='7fc2f9b85b40c5610e044404a7e821ec69349371ee4f3574e511391c0e56434c';
COUNT=$((COUNT+1))

echo "  [499/549] Would restore: Mister Sparky"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='567d190eb3dfe6eebb7c71f4cedc529c673ba961b552ec720fd956775ca4d122';
COUNT=$((COUNT+1))

echo "  [500/549] Would restore: Swift Brothers Plumbing, Heating & Air"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='98e177a3869578207541ab0438fd26a420406fa9ad00813ae6995fe64e175d42';
COUNT=$((COUNT+1))

echo "  [501/549] Would restore: The Local Plumber LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='68b120074aba031c11747392e3eaec7ac8b0975646bbd35e0bf887c4e35b55ca';
COUNT=$((COUNT+1))

echo "  [502/549] Would restore: 1-Tom-Plumber"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='838277979c24c9cc782d1f1bc67da01f11259aa323b6730a0430703d4d2096df';
COUNT=$((COUNT+1))

echo "  [503/549] Would restore: Parson Plumbing and Drains"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='13c9bf84183884e60a822e32a2c4dbc9eada35701de3f73787b7f389ddf662f3';
COUNT=$((COUNT+1))

echo "  [504/549] Would restore: SPE Electrical Services"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='503d03688de4a55118b0a7818b45a43fd894e274db1d242459f2430cf365ea0f';
COUNT=$((COUNT+1))

echo "  [505/549] Would restore: Volt Vikings"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='c4dc5fb2e1cc9de61d7e0c2a265a55d4bd76d55d3d594beafc8ca0c79958fba4';
COUNT=$((COUNT+1))

echo "  [506/549] Would restore: Sears Heating and Cooling"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='7a3aa613d1f6d287fe00c0ca70cbb915ef16b365aff668bf4497253670f883b7';
COUNT=$((COUNT+1))

echo "  [507/549] Would restore: Ace Comfort Air Conditioning & Heating"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='418cdc8ee4aa1a6e6941a14334591b7396cbbbccc38cdc6ae6117148035bf1e4';
COUNT=$((COUNT+1))

echo "  [508/549] Would restore: All Star A/C, Plumbing & Electrical"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='3587b35015f4d22919b474e06c1e600ab71f014a6f61753c7e1e9d33157f798a';
COUNT=$((COUNT+1))

echo "  [509/549] Would restore: Air Tech of Houston AC & Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='b558f652ad61b5da7aa40d83619f612206d82d8c6c18d8ab58718909a1718802';
COUNT=$((COUNT+1))

echo "  [510/549] Would restore: Chicago Roofing Company"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='792cca27faaa6c06d3f9d9f313ef49a94439f29d5906348c5cb50826c0efe302';
COUNT=$((COUNT+1))

echo "  [511/549] Would restore: Chicago Prestige Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='9ee932141f6ee15a9fa7ffbfcfc389beb9684c8c444b1787d0063f9daa68b16b';
COUNT=$((COUNT+1))

echo "  [512/549] Would restore: Chicago Roofing Solutions"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='945065763f597f312ffbc505c466619c1b9e319240943af8dee2c35e301b58da';
COUNT=$((COUNT+1))

echo "  [513/549] Would restore: Roofing By Hernandez Inc"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='62b517f614fea72317c7cdbe40c3fda52853f73462859a0246284bcd583829b3';
COUNT=$((COUNT+1))

echo "  [514/549] Would restore: Chicago Flat Roofing Contractors | Residential & Commercial Roofing Repairs"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='55c888f4aa52cd9694109b0bc270afc8be7c39141775ec26e42b707741b7960f';
COUNT=$((COUNT+1))

echo "  [515/549] Would restore: SAFE Electrical Service"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='8a389518b3b5b4ecbccba857d9a719a10f4d65c4614beaeef808498c200090d9';
COUNT=$((COUNT+1))

echo "  [516/549] Would restore: Sims & Sons Electric and Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='0d2c8fdb159c6f569b895d2f8ab3e41bbb52cc422d83aba06da47a70d5ba921b';
COUNT=$((COUNT+1))

echo "  [517/549] Would restore: Chicago Heating & Cooling"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='641446a391f68eef966aaa43b06a687f0c517938a46488fd723db0dc046f9203';
COUNT=$((COUNT+1))

echo "  [518/549] Would restore: Roland Slate Service Co., Inc."
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='cb967c535861215d7170d2081ab91c3f8b201b6d3366e7041db2e91303f0689a';
COUNT=$((COUNT+1))

echo "  [519/549] Would restore: Charm City Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='63a0416b876d7152158d518315bf99a1f1ce8fbb77057f300cbeca625a59399c';
COUNT=$((COUNT+1))

echo "  [520/549] Would restore: Four Twelve Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='dcde8ebaae6d599e4bd9e2cb44da43b37fd17217348563d107dfc98bf42904c8';
COUNT=$((COUNT+1))

echo "  [521/549] Would restore: Clinton Electric Company"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='bca6b806243ca7ecdca7cceffd74f5fb144588603c04571ed25e83cc10d4b135';
COUNT=$((COUNT+1))

echo "  [522/549] Would restore: Dynamo Electric, LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='a205096ad52da76e18f120aed6dc8295e77ab557bd7c1f66c84447093d2b5a3d';
COUNT=$((COUNT+1))

echo "  [523/549] Would restore: Rpm Electrical Company ⚡️💡🔌 💡"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='dd7e668d1030eb6a99fd54786cc88e63c4fd24a7a4d43f9e4f6ade53a606fca0';
COUNT=$((COUNT+1))

echo "  [524/549] Would restore: Common Ground Electrical"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='622ecb1a13c1542262cd5b3427821b5ae78204808e58c1536c3c7703576f76e2';
COUNT=$((COUNT+1))

echo "  [525/549] Would restore: CK'\''s Plumbing & Backflow, LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='8bd5d8432757fe19b108a574bac4b0d0bc5d94a39c508d47536888c24d0fac20';
COUNT=$((COUNT+1))

echo "  [526/549] Would restore: Matthew'\''s Plumbing Solutions"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='1885b6bf31ab490a5d3e54a5cc14ad6309d13ae6d1ba513dee2148de35648575';
COUNT=$((COUNT+1))

echo "  [527/549] Would restore: William Parrish Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='4b141af108a98e88be242b1f1ae6d183a1d717caceb3c58aa6717e0af2c872ed';
COUNT=$((COUNT+1))

echo "  [528/549] Would restore: Thermo Direct, Inc."
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='3ee6c772764cceda42c46b4883e5450c312d609e42569528c91290e9d8288a14';
COUNT=$((COUNT+1))

echo "  [529/549] Would restore: Comfort Monster Heating & Air"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='6f7899faa084e520206bb6cd0180df845fe3f10450f6c5c8d87f792b9c715804';
COUNT=$((COUNT+1))

echo "  [530/549] Would restore: P D Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='d5929dc398dc2331bc88aa7c04257d25e3cef3e95840e3b13b9dd95baaa56251';
COUNT=$((COUNT+1))

echo "  [531/549] Would restore: Detroit Roofing Service"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='199f3064638fdfacade4580e3c55d1ec569be734ed56533864c8ffd6807e2424';
COUNT=$((COUNT+1))

echo "  [532/549] Would restore: Detroit Speedy Electrician"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='54997035855415b6d11015325903f8af638afce0f1c0c05ce22f633113d29661';
COUNT=$((COUNT+1))

echo "  [533/549] Would restore: Detroit Plumbing and Drain Services"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='71cd84763652ffdc7e0ec891cfa3d050111fb363d1830d55f32b46c73f35e5c3';
COUNT=$((COUNT+1))

echo "  [534/549] Would restore: A&H HVAC SERVICES"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='20d6713dd728eaf0da3ba7f0fd2865679a06aa3d35163cbeebebc566ffd95d4d';
COUNT=$((COUNT+1))

echo "  [535/549] Would restore: Manning Mechanical"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='5eab0ebaa20f1946c3b1decd9d06c5f72bcc89b7b70f5e1f572426f83369d4ad';
COUNT=$((COUNT+1))

echo "  [536/549] Would restore: IBEX Roof"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='44e1a488b2fc3aaf2d5c94eb4c76dda4e41143fdce46d9f26aba544379389e53';
COUNT=$((COUNT+1))

echo "  [537/549] Would restore: Flow Roofing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='14720b72293587c3b9221ef627558ccb55e6535cdeb2c8ec1e00443dde40c1af';
COUNT=$((COUNT+1))

echo "  [538/549] Would restore: Portland Roofing Company LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='55327f1b102f3d4e0ed8ff597e1373f645538389bed26af390b3fdf2b105cac3';
COUNT=$((COUNT+1))

echo "  [539/549] Would restore: Falcon Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='a2a00318f3496f84603e0537d6a9073104cf42082ee8769ea95bbd169e350046';
COUNT=$((COUNT+1))

echo "  [540/549] Would restore: Young Electric LLC"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='5aaf26b92819db45b39d9f0e019a585a4a7df7d9cf477106e9c2ddde67136ea5';
COUNT=$((COUNT+1))

echo "  [541/549] Would restore: Lovett Inc."
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='a6788c58d0913e7c83f39164f7fe8d0c8cba3ea65413f0420392cec5d4e07623';
COUNT=$((COUNT+1))

echo "  [542/549] Would restore: Crown Plumbing"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='d074e190256eaa0ea7a3c90bc48ebab8e888a1dbbb1a89fb5c6d516a52886c7c';
COUNT=$((COUNT+1))

echo "  [543/549] Would restore: Sun Glow Inc. Portland"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='a14b6b4c0d2dc5f14c3747f109fdba79e76c32ccf7fc8e254207bbdec8dc0162';
COUNT=$((COUNT+1))

echo "  [544/549] Would restore: Pyramid Heating & Cooling"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='d6227e6c5a40d89accac114cc608bbadbf7bc79a7b42f9194d6661cd1a642aeb';
COUNT=$((COUNT+1))

echo "  [545/549] Would restore: Rainier Roofing Company"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='2a8d0e0c56389b1f74943634514d57608c12d0d9d3b5e94b1da402dae41e6f78';
COUNT=$((COUNT+1))

echo "  [546/549] Would restore: The Seattle Roofing Company"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='ac61a2b9c9772e0c8fed62ebfcd8419fa28953679b57e360d575611ddd409c9e';
COUNT=$((COUNT+1))

echo "  [547/549] Would restore: As You Wish Electric, Plumbing, Heating & Air"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='ca265d9369234f7fd16b2140ba1a3c15182eaf12bb4b463300e4dadd73b9f312';
COUNT=$((COUNT+1))

echo "  [548/549] Would restore: Seattle Electrician"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='46eeb32d126620837dc8771d3742757513467485e1930bb4bb5cef53dad94772';
COUNT=$((COUNT+1))

echo "  [549/549] Would restore: South West Plumbing, Heating, Air, & Electric"
# SQL: UPDATE leads_pool SET source='instaweb', notes='' WHERE lead_id='ca6f1331b49a53965c2b32ebb039f310e7e3ee6245a5603aa990bdd4a55deaff';
COUNT=$((COUNT+1))

echo "Revert plan complete."
