[33mcommit 51903968b29f14609e5522850d9ee85a1c79ce4d[m[33m ([m[1;36mHEAD[m[33m -> [m[1;32mfeature_avx512_version1_final[m[33m, [m[1;31morigin/feature_avx512_version1_final[m[33m)[m
Author: jenetscaria-mcw <jenet.scaria@multicorewareinc.com>
Date:   Wed Aug 20 11:06:51 2025 +0000

    Added fma flag for unix setup with avx512

[33mcommit a9250468b332516ad6ae8631b9c02bc7b76e5111[m
Author: jenetscaria-mcw <jenet.scaria@multicorewareinc.com>
Date:   Thu Jul 10 18:53:03 2025 +0530

    Fixes for issues with Noise8D and wrinkles functions definitions

[33mcommit ebfdc8cc98297ec7cef891dd67f7b6e68b2f81c8[m
Author: Srihari-mcw <srihari@multicorewareinc.com>
Date:   Fri Jan 17 03:16:26 2025 -0800

    Update README files

[33mcommit 8e06545a3d9ac767d9636b015ab09d2b43fa3247[m
Author: Srihari-mcw <srihari@multicorewareinc.com>
Date:   Fri Jan 17 01:19:04 2025 -0800

    update indentation

[33mcommit 1ac864b2362ef2df7472c94481bf8cb7dc36dd56[m
Author: Srihari-MCW <srihari@multicorewareinc.com>
Date:   Thu Jan 16 05:19:05 2025 -0800

    Update the gui changes along with minor fixes

[33mcommit 7066e750eb2391117d86370e91e01b2f7378919b[m
Author: Srihari-mcw <srihari@multicorewareinc.com>
Date:   Thu Nov 21 07:54:53 2024 -0800

    Make updates to fix issues with OpenEXR dependency after latest Visual Studio Updates

[33mcommit 81f15b3e9d0d7e95a12c029973f274de0e6e7232[m
Author: Srihari-mcw <srihari@multicorewareinc.com>
Date:   Sun May 14 23:38:16 2023 -0700

    Update the sheet with additional performance details

[33mcommit e26c5c424accc2feeff7c197213288dfae44c7ad[m
Author: Srihari-mcw <srihari@multicorewareinc.com>
Date:   Mon Dec 5 15:53:30 2022 -0800

    Add updates for AVX512 version of POV-RAY

[33mcommit ca8973136232460eaf1669c362f8e358e2ab84f4[m[33m ([m[1;31morigin/release/v3.8.0[m[33m)[m
Author: Christoph Lipka <c-lipka@users.noreply.github.com>
Date:   Mon Aug 9 03:11:00 2021 +0200

    Bump version number and update change log.
    
    Also minor fix to CodeQL analysis workflow, to always scan on push.

[33mcommit 89c1b28a025c887b4cea2c8e23e3f1b4da209249[m
Author: Christoph Lipka <c-lipka@users.noreply.github.com>
Date:   Mon Aug 9 02:55:43 2021 +0200

    [ci skip] Fix warnings in `functions.inc` and `glass_old.inc`.

[33mcommit 88d659851e9eb4c5b4b20327a39adb6478cf5034[m
Author: Christoph Lipka <c-lipka@users.noreply.github.com>
Date:   Mon Aug 9 02:37:33 2021 +0200

    Partial fix for #428. (#431)
    
    Precision of `Declare` INI setting was erroneously truncated to 6 digits. Reverted back to 7 digits, matching v3.6 behavior.

[33mcommit 5c8aface338fe651feb9fb38616aab54bfb94067[m
Author: Christoph Lipka <c-lipka@users.noreply.github.com>
Date:   Mon Aug 9 02:19:57 2021 +0200

    Fix for #432. (#433)
    
    To work around Boost's msec-precision UTC timer erroneously reporting local time instead of UTC on some systems, we're now also probing the sec-precision UTC timer, which should be more reliable in terms of time zone: The rounded difference between the two should be able to give us the time zone offset (if any) in the msec-precision timer, which we then compensate for accordingly.
