JVM_OPTIONS="-Xmx1G -Xms1G -XX:+AlwaysPreTouch -XX:+UnlockDiagnosticVMOptions -XX:+DumpVitalsAtExit -XX:VitalsSampleInterval=1 -XX:MonitorUsedDeflationThreshold=30 -XX:NativeMemoryTracking=summary -XX:+PrintNMTStatistics"
TEST_OPTIONS="--type=peak --allocdelay=1 --randfactor=3 --randseed=4040 -y --waitsecs=76"


TESTNAME=baseline
JVM_OPTIONS_HERE="-XX:-AutoTrimNativeHeap"
../../jdk-jdk/output-release/images/jdk/bin/java $JVM_OPTIONS $JVM_OPTIONS_HERE -XX:VitalsFile=$TESTNAME -cp /shared/projects/openjdk/test/repros/repros8/target/repros8-1.0.jar de.stuefe.repros.AllocCHeap $TEST_OPTIONS | tee ${TESTNAME}-out.txt

TESTNAME=autotrim-1s
JVM_OPTIONS_HERE="-XX:+AutoTrimNativeHeap -XX:AutoTrimNativeHeapInterval=1"
../../jdk-jdk/output-release/images/jdk/bin/java $JVM_OPTIONS $JVM_OPTIONS_HERE -XX:VitalsFile=$TESTNAME -cp /shared/projects/openjdk/test/repros/repros8/target/repros8-1.0.jar de.stuefe.repros.AllocCHeap $TEST_OPTIONS | tee ${TESTNAME}-out.txt

TESTNAME=autotrim-30s
JVM_OPTIONS_HERE="-XX:+AutoTrimNativeHeap -XX:AutoTrimNativeHeapInterval=30"
../../jdk-jdk/output-release/images/jdk/bin/java $JVM_OPTIONS $JVM_OPTIONS_HERE -XX:VitalsFile=$TESTNAME -cp /shared/projects/openjdk/test/repros/repros8/target/repros8-1.0.jar de.stuefe.repros.AllocCHeap $TEST_OPTIONS | tee ${TESTNAME}-out.txt

TESTNAME=autotrim-1s-adaptive
JVM_OPTIONS_HERE="-XX:+AutoTrimNativeHeap -XX:AutoTrimNativeHeapInterval=1 -XX:+AutoTrimNativeHeapIntervalAdaptive"
../../jdk-jdk/output-release/images/jdk/bin/java $JVM_OPTIONS $JVM_OPTIONS_HERE -XX:VitalsFile=$TESTNAME -cp /shared/projects/openjdk/test/repros/repros8/target/repros8-1.0.jar de.stuefe.repros.AllocCHeap $TEST_OPTIONS | tee ${TESTNAME}-out.txt


