JVM_OPTIONS="-Xcomp -Xmx128m -Xms128m -XX:+AlwaysPreTouch -XX:+UnlockDiagnosticVMOptions -XX:+DumpVitalsAtExit -XX:VitalsSampleInterval=1 -XX:MonitorUsedDeflationThreshold=30 -XX:NativeMemoryTracking=summary -XX:+PrintNMTStatistics"

TESTNAME=baseline
JVM_OPTIONS_HERE="-XX:-AutoTrimNativeHeap"
/shared/projects/openjdk/jdk-jdk/output-release/images/jdk/bin/java $JVM_OPTIONS $JVM_OPTIONS_HERE  -XX:VitalsFile=$TESTNAME  -jar /shared/projects/spring-petclinic/target/spring-petclinic-2.5.0-SNAPSHOT.jar 

TESTNAME=autotrim-1s
JVM_OPTIONS_HERE="-XX:+AutoTrimNativeHeap -XX:AutoTrimNativeHeapInterval=1"
/shared/projects/openjdk/jdk-jdk/output-release/images/jdk/bin/java $JVM_OPTIONS $JVM_OPTIONS_HERE   -XX:VitalsFile=$TESTNAME -jar /shared/projects/spring-petclinic/target/spring-petclinic-2.5.0-SNAPSHOT.jar 

TESTNAME=autotrim-30s
JVM_OPTIONS_HERE="-XX:+AutoTrimNativeHeap -XX:AutoTrimNativeHeapInterval=30"
/shared/projects/openjdk/jdk-jdk/output-release/images/jdk/bin/java $JVM_OPTIONS $JVM_OPTIONS_HERE  -XX:VitalsFile=$TESTNAME -jar /shared/projects/spring-petclinic/target/spring-petclinic-2.5.0-SNAPSHOT.jar 

TESTNAME=autotrim-1s-adaptive
JVM_OPTIONS_HERE="-XX:+AutoTrimNativeHeap -XX:AutoTrimNativeHeapInterval=1 -XX:+AutoTrimNativeHeapIntervalAdaptive"
/shared/projects/openjdk/jdk-jdk/output-release/images/jdk/bin/java $JVM_OPTIONS $JVM_OPTIONS_HERE  -XX:VitalsFile=$TESTNAME -jar /shared/projects/spring-petclinic/target/spring-petclinic-2.5.0-SNAPSHOT.jar 

