JVM_OPTIONS="-Xmx256m -Xms256m -XX:+UnlockDiagnosticVMOptions -XX:+DumpVitalsAtExit -XX:VitalsSampleInterval=5 -XX:MonitorUsedDeflationThreshold=50 -XX:NativeMemoryTracking=summary -XX:+PrintNMTStatistics"
BENCHMARK_OPTIONS="-r 100"

TESTNAME=renaissance-mit-autotrim-1s
JVM_OPTIONS_HERE="-XX:+AutoTrimNativeHeap -XX:AutoTrimNativeHeapInterval=1"
../../jdk-jdk/output-release/images/jdk/bin/java $JVM_OPTIONS $JVM_OPTIONS_HERE -XX:VitalsFile=$TESTNAME -jar ../../benchmarks/renaissance/renaissance-gpl-0.13.0.jar philosophers $BENCHMARK_OPTIONS 2>&1 | tee ${TESTNAME}-benchout.txt

TESTNAME=renaissance-mit-autotrim-30s
JVM_OPTIONS_HERE="-XX:+AutoTrimNativeHeap -XX:AutoTrimNativeHeapInterval=30"
../../jdk-jdk/output-release/images/jdk/bin/java $JVM_OPTIONS $JVM_OPTIONS_HERE -XX:VitalsFile=$TESTNAME -jar ../../benchmarks/renaissance/renaissance-gpl-0.13.0.jar philosophers $BENCHMARK_OPTIONS 2>&1 | tee ${TESTNAME}-benchout.txt

TESTNAME=renaissance-ohne-autotrim
JVM_OPTIONS_HERE="-XX:-AutoTrimNativeHeap"
../../jdk-jdk/output-release/images/jdk/bin/java $JVM_OPTIONS $JVM_OPTIONS_HERE -XX:VitalsFile=$TESTNAME -jar ../../benchmarks/renaissance/renaissance-gpl-0.13.0.jar philosophers $BENCHMARK_OPTIONS 2>&1 | tee ${TESTNAME}-benchout.txt

