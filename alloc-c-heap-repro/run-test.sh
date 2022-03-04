JVM_OPTIONS="-Xmx1G -Xms1G -XX:+UnlockDiagnosticVMOptions -XX:+DumpVitalsAtExit -XX:VitalsSampleInterval=1 -XX:MonitorUsedDeflationThreshold=50 -XX:NativeMemoryTracking=summary -XX:+PrintNMTStatistics"
TEST_OPTIONS="--type=peak -y --cycles=5 --waitsecs=60"

TESTNAME=alloc-c-heap-mit-autotrim
JVM_OPTIONS_HERE="-XX:+AutoTrimNativeHeap -XX:AutoTrimNativeHeapInterval=10"
../../jdk-jdk/output-release/images/jdk/bin/java $JVM_OPTIONS $JVM_OPTIONS_HERE -XX:VitalsFile=$TESTNAME -cp ../../test/repros/repros8/target/repros8-1.0.jar de.stuefe.repros.AllocCHeap $TEST_OPTIONS 2>&1 | tee ${TESTNAME}-out.txt

TESTNAME=alloc-c-heap-ohne-autotrim
JVM_OPTIONS_HERE="-XX:-AutoTrimNativeHeap"
../../jdk-jdk/output-release/images/jdk/bin/java $JVM_OPTIONS $JVM_OPTIONS_HERE -XX:VitalsFile=$TESTNAME -cp ../../test/repros/repros8/target/repros8-1.0.jar de.stuefe.repros.AllocCHeap $TEST_OPTIONS 2>&1 | tee ${TESTNAME}-out.txt

