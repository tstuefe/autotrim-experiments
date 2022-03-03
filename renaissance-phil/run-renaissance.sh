JVM_OPTIONS="-Xmx256m -Xms256m -XX:+UnlockDiagnosticVMOptions -XX:+DumpVitalsAtExit -XX:VitalsSampleInterval=1 -XX:MonitorUsedDeflationThreshold=50 -XX:NativeMemoryTracking=summary -XX:+PrintNMTStatistics"
BENCHMARK_OPTIONS="-r 50"

TESTNAME=renaissance-mit-autotrim
JVM_OPTIONS_HERE="-XX:+AutoTrimNativeHeap -XX:AutoTrimNativeHeapInterval=10"
../../jdk-jdk/output-release/images/jdk/bin/java $JVM_OPTIONS $JVM_OPTIONS_HERE -XX:VitalsFile=$TESTNAME -jar ../../benchmarks/renaissance/renaissance-gpl-0.13.0.jar philosophers $BENCHMARK_OPTIONS 2>&1 | tee ${TESTNAME}-benchout.txt

TESTNAME=renaissance-ohne-autotrim
JVM_OPTIONS_HERE="-XX:-AutoTrimNativeHeap"
../../jdk-jdk/output-release/images/jdk/bin/java $JVM_OPTIONS $JVM_OPTIONS_HERE -XX:VitalsFile=$TESTNAME -jar ../../benchmarks/renaissance/renaissance-gpl-0.13.0.jar philosophers $BENCHMARK_OPTIONS 2>&1 | tee ${TESTNAME}-benchout.txt

