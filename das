[33mcommit 8a8ac1d3970a6fe4a81f1593c459007b3415b269[m[33m ([m[1;36mHEAD -> [m[1;32mdevelop[m[33m, [m[1;32mmaster[m[33m)[m
Author: ssarmango <ssarmango@gmail.com>
Date:   Thu May 9 11:51:29 2019 +0900

    환경설정 완료

[1mdiff --git a/.gitignore b/.gitignore[m
[1mnew file mode 100644[m
[1mindex 0000000..153c933[m
[1m--- /dev/null[m
[1m+++ b/.gitignore[m
[36m@@ -0,0 +1,29 @@[m
[32m+[m[32mHELP.md[m
[32m+[m[32m/target/[m
[32m+[m[32m!.mvn/wrapper/maven-wrapper.jar[m
[32m+[m
[32m+[m[32m### STS ###[m
[32m+[m[32m.apt_generated[m
[32m+[m[32m.classpath[m
[32m+[m[32m.factorypath[m
[32m+[m[32m.project[m
[32m+[m[32m.settings[m
[32m+[m[32m.springBeans[m
[32m+[m[32m.sts4-cache[m
[32m+[m
[32m+[m[32m### IntelliJ IDEA ###[m
[32m+[m[32m.idea[m
[32m+[m[32m*.iws[m
[32m+[m[32m*.iml[m
[32m+[m[32m*.ipr[m
[32m+[m
[32m+[m[32m### NetBeans ###[m
[32m+[m[32m/nbproject/private/[m
[32m+[m[32m/nbbuild/[m
[32m+[m[32m/dist/[m
[32m+[m[32m/nbdist/[m
[32m+[m[32m/.nb-gradle/[m
[32m+[m[32m/build/[m
[32m+[m
[32m+[m[32m### VS Code ###[m
[32m+[m[32m.vscode/[m
[1mdiff --git a/.mvn/wrapper/MavenWrapperDownloader.java b/.mvn/wrapper/MavenWrapperDownloader.java[m
[1mnew file mode 100644[m
[1mindex 0000000..72308aa[m
[1m--- /dev/null[m
[1m+++ b/.mvn/wrapper/MavenWrapperDownloader.java[m
[36m@@ -0,0 +1,114 @@[m
[32m+[m[32m/*[m
[32m+[m[32mLicensed to the Apache Software Foundation (ASF) under one[m
[32m+[m[32mor more contributor license agreements.  See the NOTICE file[m
[32m+[m[32mdistributed with this work for additional information[m
[32m+[m[32mregarding copyright ownership.  The ASF licenses this file[m
[32m+[m[32mto you under the Apache License, Version 2.0 (the[m
[32m+[m[32m"License"); you may not use this file except in compliance[m
[32m+[m[32mwith the License.  You may obtain a copy of the License at[m
[32m+[m
[32m+[m[32m  https://www.apache.org/licenses/LICENSE-2.0[m
[32m+[m
[32m+[m[32mUnless required by applicable law or agreed to in writing,[m
[32m+[m[32msoftware distributed under the License is distributed on an[m
[32m+[m[32m"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY[m
[32m+[m[32mKIND, either express or implied.  See the License for the[m
[32m+[m[32mspecific language governing permissions and limitations[m
[32m+[m[32munder the License.[m
[32m+[m[32m*/[m
[32m+[m
[32m+[m[32mimport java.io.File;[m
[32m+[m[32mimport java.io.FileInputStream;[m
[32m+[m[32mimport java.io.FileOutputStream;[m
[32m+[m[32mimport java.io.IOException;[m
[32m+[m[32mimport java.net.URL;[m
[32m+[m[32mimport java.nio.channels.Channels;[m
[32m+[m[32mimport java.nio.channels.ReadableByteChannel;[m
[32m+[m[32mimport java.util.Properties;[m
[32m+[m
[32m+[m[32mpublic class MavenWrapperDownloader {[m
[32m+[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Default URL to download the maven-wrapper.jar from, if no 'downloadUrl' is provided.[m
[32m+[m[32m     */[m
[32m+[m[32m    private static final String DEFAULT_DOWNLOAD_URL =[m
[32m+[m[32m            "https://repo.maven.apache.org/maven2/io/takari/maven-wrapper/0.4.2/maven-wrapper-0.4.2.jar";[m
[32m+[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Path to the maven-wrapper.properties file, which might contain a downloadUrl property to[m
[32m+[m[32m     * use instead of the default one.[m
[32m+[m[32m     */[m
[32m+[m[32m    private static final String MAVEN_WRAPPER_PROPERTIES_PATH =[m
[32m+[m[32m            ".mvn/wrapper/maven-wrapper.properties";[m
[32m+[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Path where the maven-wrapper.jar will be saved to.[m
[32m+[m[32m     */[m
[32m+[m[32m    private static final String MAVEN_WRAPPER_JAR_PATH =[m
[32m+[m[32m            ".mvn/wrapper/maven-wrapper.jar";[m
[32m+[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Name of the property which should be used to override the default download url for the wrapper.[m
[32m+[m[32m     */[m
[32m+[m[32m    private static final String PROPERTY_NAME_WRAPPER_URL = "wrapperUrl";[m
[32m+[m
[32m+[m[32m    public static void main(String args[]) {[m
[32m+[m[32m        System.out.println("- Downloader started");[m
[32m+[m[32m        File baseDirectory = new File(args[0]);[m
[32m+[m[32m        System.out.println("- Using base directory: " + baseDirectory.getAbsolutePath());[m
[32m+[m
[32m+[m[32m        // If the maven-wrapper.properties exists, read it and check if it contains a custom[m
[32m+[m[32m        // wrapperUrl parameter.[m
[32m+[m[32m        File mavenWrapperPropertyFile = new File(baseDirectory, MAVEN_WRAPPER_PROPERTIES_PATH);[m
[32m+[m[32m        String url = DEFAULT_DOWNLOAD_URL;[m
[32m+[m[32m        if(mavenWrapperPropertyFile.exists()) {[m
[32m+[m[32m            FileInputStream mavenWrapperPropertyFileInputStream = null;[m
[32m+[m[32m            try {[m
[32m+[m[32m                mavenWrapperPropertyFileInputStream = new FileInputStream(mavenWrapperPropertyFile);[m
[32m+[m[32m                Properties mavenWrapperProperties = new Properties();[m
[32m+[m[32m                mavenWrapperProperties.load(mavenWrapperPropertyFileInputStream);[m
[32m+[m[32m                url = mavenWrapperProperties.getProperty(PROPERTY_NAME_WRAPPER_URL, url);[m
[32m+[m[32m            } catch (IOException e) {[m
[32m+[m[32m                System.out.println("- ERROR loading '" + MAVEN_WRAPPER_PROPERTIES_PATH + "'");[m
[32m+[m[32m            } finally {[m
[32m+[m[32m                try {[m
[32m+[m[32m                    if(mavenWrapperPropertyFileInputStream != null) {[m
[32m+[m[32m                        mavenWrapperPropertyFileInputStream.close();[m
[32m+[m[32m                    }[m
[32m+[m[32m                } catch (IOException e) {[m
[32m+[m[32m                    // Ignore ...[m
[32m+[m[32m                }[m
[32m+[m[32m            }[m
[32m+[m[32m        }[m
[32m+[m[32m        System.out.println("- Downloading from: : " + url);[m
[32m+[m
[32m+[m[32m        File outputFile = new File(baseDirectory.getAbsolutePath(), MAVEN_WRAPPER_JAR_PATH);[m
[32m+[m[32m        if(!outputFile.getParentFile().exists()) {[m
[32m+[m[32m            if(!outputFile.getParentFile().mkdirs()) {[m
[32m+[m[32m                System.out.println([m
[32m+[m[32m                        "- ERROR creating output direcrory '" + outputFile.getParentFile().getAbsolutePath() + "'");[m
[32m+[m[32m            }[m
[32m+[m[32m        }[m
[32m+[m[32m        System.out.println("- Downloading to: " + outputFile.getAbsolutePath());[m
[32m+[m[32m        try {[m
[32m+[m[32m            downloadFileFromURL(url, outputFile);[m
[32m+[m[32m            System.out.println("Done");[m
[32m+[m[32m            System.exit(0);[m
[32m+[m[32m        } catch (Throwable e) {[m
[32m+[m[32m            System.out.println("- Error downloading");[m
[32m+[m[32m            e.printStackTrace();[m
[32m+[m[32m            System.exit(1);[m
[32m+[m[32m        }[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    private static void downloadFileFromURL(String urlString, File destination) throws Exception {[m
[32m+[m[32m        URL website = new URL(urlString);[m
[32m+[m[32m        ReadableByteChannel rbc;[m
[32m+[m[32m        rbc = Channels.newChannel(website.openStream());[m
[32m+[m[32m        FileOutputStream fos = new FileOutputStream(destination);[m
[32m+[m[32m        fos.getChannel().transferFrom(rbc, 0, Long.MAX_VALUE);[m
[32m+[m[32m        fos.close();[m
[32m+[m[32m        rbc.close();[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m}[m
[1mdiff --git a/.mvn/wrapper/maven-wrapper.jar b/.mvn/wrapper/maven-wrapper.jar[m
[1mnew file mode 100644[m
[1mindex 0000000..01e6799[m
Binary files /dev/null and b/.mvn/wrapper/maven-wrapper.jar differ
[1mdiff --git a/.mvn/wrapper/maven-wrapper.properties b/.mvn/wrapper/maven-wrapper.properties[m
[1mnew file mode 100644[m
[1mindex 0000000..cd0d451[m
[1m--- /dev/null[m
[1m+++ b/.mvn/wrapper/maven-wrapper.properties[m
[36m@@ -0,0 +1 @@[m
[32m+[m[32mdistributionUrl=https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/3.6.0/apache-maven-3.6.0-bin.zip[m
[1mdiff --git a/README.md b/README.md[m
[1mnew file mode 100644[m
[1mindex 0000000..5908d8a[m
[1m--- /dev/null[m
[1m+++ b/README.md[m
[36m@@ -0,0 +1,2 @@[m
[32m+[m[32m### Git[m
[32m+[m[32m* git init[m
\ No newline at end of file[m
[1mdiff --git a/mvnw b/mvnw[m
[1mnew file mode 100644[m
[1mindex 0000000..8b9da3b[m
[1m--- /dev/null[m
[1m+++ b/mvnw[m
[36m@@ -0,0 +1,286 @@[m
[32m+[m[32m#!/bin/sh[m
[32m+[m[32m# ----------------------------------------------------------------------------[m
[32m+[m[32m# Licensed to the Apache Software Foundation (ASF) under one[m
[32m+[m[32m# or more contributor license agreements.  See the NOTICE file[m
[32m+[m[32m# distributed with this work for additional information[m
[32m+[m[32m# regarding copyright ownership.  The ASF licenses this file[m
[32m+[m[32m# to you under the Apache License, Version 2.0 (the[m
[32m+[m[32m# "License"); you may not use this file except in compliance[m
[32m+[m[32m# with the License.  You may obtain a copy of the License at[m
[32m+[m[32m#[m
[32m+[m[32m#    https://www.apache.org/licenses/LICENSE-2.0[m
[32m+[m[32m#[m
[32m+[m[32m# Unless required by applicable law or agreed to in writing,[m
[32m+[m[32m# software distributed under the License is distributed on an[m
[32m+[m[32m# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY[m
[32m+[m[32m# KIND, either express or implied.  See the License for the[m
[32m+[m[32m# specific language governing permissions and limitations[m
[32m+[m[32m# under the License.[m
[32m+[m[32m# ----------------------------------------------------------------------------[m
[32m+[m
[32m+[m[32m# ----------------------------------------------------------------------------[m
[32m+[m[32m# Maven2 Start Up Batch script[m
[32m+[m[32m#[m
[32m+[m[32m# Required ENV vars:[m
[32m+[m[32m# ------------------[m
[32m+[m[32m#   JAVA_HOME - location of a JDK home dir[m
[32m+[m[32m#[m
[32m+[m[32m# Optional ENV vars[m
[32m+[m[32m# -----------------[m
[32m+[m[32m#   M2_HOME - location of maven2's installed home dir[m
[32m+[m[32m#   MAVEN_OPTS - parameters passed to the Java VM when running Maven[m
[32m+[m[32m#     e.g. to debug Maven itself, use[m
[32m+[m[32m#       set MAVEN_OPTS=-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=8000[m
[32m+[m[32m#   MAVEN_SKIP_RC - flag to disable loading of mavenrc files[m
[32m+[m[32m# ----------------------------------------------------------------------------[m
[32m+[m
[32m+[m[32mif [ -z "$MAVEN_SKIP_RC" ] ; then[m
[32m+[m
[32m+[m[32m  if [ -f /etc/mavenrc ] ; then[m
[32m+[m[32m    . /etc/mavenrc[m
[32m+[m[32m  fi[m
[32m+[m
[32m+[m[32m  if [ -f "$HOME/.mavenrc" ] ; then[m
[32m+[m[32m    . "$HOME/.mavenrc"[m
[32m+[m[32m  fi[m
[32m+[m
[32m+[m[32mfi[m
[32m+[m
[32m+[m[32m# OS specific support.  $var _must_ be set to either true or false.[m
[32m+[m[32mcygwin=false;[m
[32m+[m[32mdarwin=false;[m
[32m+[m[32mmingw=false[m
[32m+[m[32mcase "`uname`" in[m
[32m+[m[32m  CYGWIN*) cygwin=true ;;[m
[32m+[m[32m  MINGW*) mingw=true;;[m
[32m+[m[32m  Darwin*) darwin=true[m
[32m+[m[32m    # Use /usr/libexec/java_home if available, otherwise fall back to /Library/Java/Home[m
[32m+[m[32m    # See https://developer.apple.com/library/mac/qa/qa1170/_index.html[m
[32m+[m[32m    if [ -z "$JAVA_HOME" ]; then[m
[32m+[m[32m      if [ -x "/usr/libexec/java_home" ]; then[m
[32m+[m[32m        export JAVA_HOME="`/usr/libexec/java_home`"[m
[32m+[m[32m      else[m
[32m+[m[32m        export JAVA_HOME="/Library/Java/Home"[m
[32m+[m[32m      fi[m
[32m+[m[32m    fi[m
[32m+[m[32m    ;;[m
[32m+[m[32mesac[m
[32m+[m
[32m+[m[32mif [ -z "$JAVA_HOME" ] ; then[m
[32m+[m[32m  if [ -r /etc/gentoo-release ] ; then[m
[32m+[m[32m    JAVA_HOME=`java-config --jre-home`[m
[32m+[m[32m  fi[m
[32m+[m[32mfi[m
[32m+[m
[32m+[m[32mif [ -z "$M2_HOME" ] ; then[m
[32m+[m[32m  ## resolve links - $0 may be a link to maven's home[m
[32m+[m[32m  PRG="$0"[m
[32m+[m
[32m+[m[32m  # need this for relative symlinks[m
[32m+[m[32m  while [ -h "$PRG" ] ; do[m
[32m+[m[32m    ls=`ls -ld "$PRG"`[m
[32m+[m[32m    link=`expr "$ls" : '.*-> \(.*\)$'`[m
[32m+[m[32m    if expr "$link" : '/.*' > /dev/null; then[m
[32m+[m[32m      PRG="$link"[m
[32m+[m[32m    else[m
[32m+[m[32m      PRG="`dirname "$PRG"`/$link"[m
[32m+[m[32m    fi[m
[32m+[m[32m  done[m
[32m+[m
[32m+[m[32m  saveddir=`pwd`[m
[32m+[m
[32m+[m[32m  M2_HOME=`dirname "$PRG"`/..[m
[32m+[m
[32m+[m[32m  # make it fully qualified[m
[32m+[m[32m  M2_HOME=`cd "$M2_HOME" && pwd`[m
[32m+[m
[32m+[m[32m  cd "$saveddir"[m
[32m+[m[32m  # echo Using m2 at $M2_HOME[m
[32m+[m[32mfi[m
[32m+[m
[32m+[m[32m# For Cygwin, ensure paths are in UNIX format before anything is touched[m
[32m+[m[32mif $cygwin ; then[m
[32m+[m[32m  [ -n "$M2_HOME" ] &&[m
[32m+[m[32m    M2_HOME=`cygpath --unix "$M2_HOME"`[m
[32m+[m[32m  [ -n "$JAVA_HOME" ] &&[m
[32m+[m[32m    JAVA_HOME=`cygpath --unix "$JAVA_HOME"`[m
[32m+[m[32m  [ -n "$CLASSPATH" ] &&[m
[32m+[m[32m    CLASSPATH=`cygpath --path --unix "$CLASSPATH"`[m
[32m+[m[32mfi[m
[32m+[m
[32m+[m[32m# For Mingw, ensure paths are in UNIX format before anything is touched[m
[32m+[m[32mif $mingw ; then[m
[32m+[m[32m  [ -n "$M2_HOME" ] &&[m
[32m+[m[32m    M2_HOME="`(cd "$M2_HOME"; pwd)`"[m
[32m+[m[32m  [ -n "$JAVA_HOME" ] &&[m
[32m+[m[32m    JAVA_HOME="`(cd "$JAVA_HOME"; pwd)`"[m
[32m+[m[32m  # TODO classpath?[m
[32m+[m[32mfi[m
[32m+[m
[32m+[m[32mif [ -z "$JAVA_HOME" ]; then[m
[32m+[m[32m  javaExecutable="`which javac`"[m
[32m+[m[32m  if [ -n "$javaExecutable" ] && ! [ "`expr \"$javaExecutable\" : '\([^ ]*\)'`" = "no" ]; then[m
[32m+[m[32m    # readlink(1) is not available as standard on Solaris 10.[m
[32m+[m[32m    readLink=`which readlink`[m
[32m+[m[32m    if [ ! `expr "$readLink" : '\([^ ]*\)'` = "no" ]; then[m
[32m+[m[32m      if $darwin ; then[m
[32m+[m[32m        javaHome="`dirname \"$javaExecutable\"`"[m
[32m+[m[32m        javaExecutable="`cd \"$javaHome\" && pwd -P`/javac"[m
[32m+[m[32m      else[m
[32m+[m[32m        javaExecutable="`readlink -f \"$javaExecutable\"`"[m
[32m+[m[32m      fi[m
[32m+[m[32m      javaHome="`dirname \"$javaExecutable\"`"[m
[32m+[m[32m      javaHome=`expr "$javaHome" : '\(.*\)/bin'`[m
[32m+[m[32m      JAVA_HOME="$javaHome"[m
[32m+[m[32m      export JAVA_HOME[m
[32m+[m[32m    fi[m
[32m+[m[32m  fi[m
[32m+[m[32mfi[m
[32m+[m
[32m+[m[32mif [ -z "$JAVACMD" ] ; then[m
[32m+[m[32m  if [ -n "$JAVA_HOME"  ] ; then[m
[32m+[m[32m    if [ -x "$JAVA_HOME/jre/sh/java" ] ; then[m
[32m+[m[32m      # IBM's JDK on AIX uses strange locations for the executables[m
[32m+[m[32m      JAVACMD="$JAVA_HOME/jre/sh/java"[m
[32m+[m[32m    else[m
[32m+[m[32m      JAVACMD="$JAVA_HOME/bin/java"[m
[32m+[m[32m    fi[m
[32m+[m[32m  else[m
[32m+[m[32m    JAVACMD="`which java`"[m
[32m+[m[32m  fi[m
[32m+[m[32mfi[m
[32m+[m
[32m+[m[32mif [ ! -x "$JAVACMD" ] ; then[m
[32m+[m[32m  echo "Error: JAVA_HOME is not defined correctly." >&2[m
[32m+[m[32m  echo "  We cannot execute $JAVACMD" >&2[m
[32m+[m[32m  exit 1[m
[32m+[m[32mfi[m
[32m+[m
[32m+[m[32mif [ -z "$JAVA_HOME" ] ; then[m
[32m+[m[32m  echo "Warning: JAVA_HOME environment variable is not set."[m
[32m+[m[32mfi[m
[32m+[m
[32m+[m[32mCLASSWORLDS_LAUNCHER=org.codehaus.plexus.classworlds.launcher.Launcher[m
[32m+[m
[32m+[m[32m# traverses directory structure from process work directory to filesystem root[m
[32m+[m[32m# first directory with .mvn subdirectory is considered project base directory[m
[32m+[m[32mfind_maven_basedir() {[m
[32m+[m
[32m+[m[32m  if [ -z "$1" ][m
[32m+[m[32m  then[m
[32m+[m[32m    echo "Path not specified to find_maven_basedir"[m
[32m+[m[32m    return 1[m
[32m+[m[32m  fi[m
[32m+[m
[32m+[m[32m  basedir="$1"[m
[32m+[m[32m  wdir="$1"[m
[32m+[m[32m  while [ "$wdir" != '/' ] ; do[m
[32m+[m[32m    if [ -d "$wdir"/.mvn ] ; then[m
[32m+[m[32m      basedir=$wdir[m
[32m+[m[32m      break[m
[32m+[m[32m    fi[m
[32m+[m[32m    # workaround for JBEAP-8937 (on Solaris 10/Sparc)[m
[32m+[m[32m    if [ -d "${wdir}" ]; then[m
[32m+[m[32m      wdir=`cd "$wdir/.."; pwd`[m
[32m+[m[32m    fi[m
[32m+[m[32m    # end of workaround[m
[32m+[m[32m  done[m
[32m+[m[32m  echo "${basedir}"[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m# concatenates all lines of a file[m
[32m+[m[32mconcat_lines() {[m
[32m+[m[32m  if [ -f "$1" ]; then[m
[32m+[m[32m    echo "$(tr -s '\n' ' ' < "$1")"[m
[32m+[m[32m  fi[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32mBASE_DIR=`find_maven_basedir "$(pwd)"`[m
[32m+[m[32mif [ -z "$BASE_DIR" ]; then[m
[32m+[m[32m  exit 1;[m
[32m+[m[32mfi[m
[32m+[m
[32m+[m[32m##########################################################################################[m
[32m+[m[32m# Extension to allow automatically downloading the maven-wrapper.jar from Maven-central[m
[32m+[m[32m# This allows using the maven wrapper in projects that prohibit checking in binary data.[m
[32m+[m[32m##########################################################################################[m
[32m+[m[32mif [ -r "$BASE_DIR/.mvn/wrapper/maven-wrapper.jar" ]; then[m
[32m+[m[32m    if [ "$MVNW_VERBOSE" = true ]; then[m
[32m+[m[32m      echo "Found .mvn/wrapper/maven-wrapper.jar"[m
[32m+[m[32m    fi[m
[32m+[m[32melse[m
[32m+[m[32m    if [ "$MVNW_VERBOSE" = true ]; then[m
[32m+[m[32m      echo "Couldn't find .mvn/wrapper/maven-wrapper.jar, downloading it ..."[m
[32m+[m[32m    fi[m
[32m+[m[32m    jarUrl="https://repo.maven.apache.org/maven2/io/takari/maven-wrapper/0.4.2/maven-wrapper-0.4.2.jar"[m
[32m+[m[32m    while IFS="=" read key value; do[m
[32m+[m[32m      case "$key" in (wrapperUrl) jarUrl="$value"; break ;;[m
[32m+[m[32m      esac[m
[32m+[m[32m    done < "$BASE_DIR/.mvn/wrapper/maven-wrapper.properties"[m
[32m+[m[32m    if [ "$MVNW_VERBOSE" = true ]; then[m
[32m+[m[32m      echo "Downloading from: $jarUrl"[m
[32m+[m[32m    fi[m
[32m+[m[32m    wrapperJarPath="$BASE_DIR/.mvn/wrapper/maven-wrapper.jar"[m
[32m+[m
[32m+[m[32m    if command -v wget > /dev/null; then[m
[32m+[m[32m        if [ "$MVNW_VERBOSE" = true ]; then[m
[32m+[m[32m          echo "Found wget ... using wget"[m
[32m+[m[32m        fi[m
[32m+[m[32m        wget "$jarUrl" -O "$wrapperJarPath"[m
[32m+[m[32m    elif command -v curl > /dev/null; then[m
[32m+[m[32m        if [ "$MVNW_VERBOSE" = true ]; then[m
[32m+[m[32m          echo "Found curl ... using curl"[m
[32m+[m[32m        fi[m
[32m+[m[32m        curl -o "$wrapperJarPath" "$jarUrl"[m
[32m+[m[32m    else[m
[32m+[m[32m        if [ "$MVNW_VERBOSE" = true ]; then[m
[32m+[m[32m          echo "Falling back to using Java to download"[m
[32m+[m[32m        fi[m
[32m+[m[32m        javaClass="$BASE_DIR/.mvn/wrapper/MavenWrapperDownloader.java"[m
[32m+[m[32m        if [ -e "$javaClass" ]; then[m
[32m+[m[32m            if [ ! -e "$BASE_DIR/.mvn/wrapper/MavenWrapperDownloader.class" ]; then[m
[32m+[m[32m                if [ "$MVNW_VERBOSE" = true ]; then[m
[32m+[m[32m                  echo " - Compiling MavenWrapperDownloader.java ..."[m
[32m+[m[32m                fi[m
[32m+[m[32m                # Compiling the Java class[m
[32m+[m[32m                ("$JAVA_HOME/bin/javac" "$javaClass")[m
[32m+[m[32m            fi[m
[32m+[m[32m            if [ -e "$BASE_DIR/.mvn/wrapper/MavenWrapperDownloader.class" ]; then[m
[32m+[m[32m                # Running the downloader[m
[32m+[m[32m                if [ "$MVNW_VERBOSE" = true ]; then[m
[32m+[m[32m                  echo " - Running MavenWrapperDownloader.java ..."[m
[32m+[m[32m                fi[m
[32m+[m[32m                ("$JAVA_HOME/bin/java" -cp .mvn/wrapper MavenWrapperDownloader "$MAVEN_PROJECTBASEDIR")[m
[32m+[m[32m            fi[m
[32m+[m[32m        fi[m
[32m+[m[32m    fi[m
[32m+[m[32mfi[m
[32m+[m[32m##########################################################################################[m
[32m+[m[32m# End of extension[m
[32m+[m[32m##########################################################################################[m
[32m+[m
[32m+[m[32mexport MAVEN_PROJECTBASEDIR=${MAVEN_BASEDIR:-"$BASE_DIR"}[m
[32m+[m[32mif [ "$MVNW_VERBOSE" = true ]; then[m
[32m+[m[32m  echo $MAVEN_PROJECTBASEDIR[m
[32m+[m[32mfi[m
[32m+[m[32mMAVEN_OPTS="$(concat_lines "$MAVEN_PROJECTBASEDIR/.mvn/jvm.config") $MAVEN_OPTS"[m
[32m+[m
[32m+[m[32m# For Cygwin, switch paths to Windows format before running java[m
[32m+[m[32mif $cygwin; then[m
[32m+[m[32m  [ -n "$M2_HOME" ] &&[m
[32m+[m[32m    M2_HOME=`cygpath --path --windows "$M2_HOME"`[m
[32m+[m[32m  [ -n "$JAVA_HOME" ] &&[m
[32m+[m[32m    JAVA_HOME=`cygpath --path --windows "$JAVA_HOME"`[m
[32m+[m[32m  [ -n "$CLASSPATH" ] &&[m
[32m+[m[32m    CLASSPATH=`cygpath --path --windows "$CLASSPATH"`[m
[32m+[m[32m  [ -n "$MAVEN_PROJECTBASEDIR" ] &&[m
[32m+[m[32m    MAVEN_PROJECTBASEDIR=`cygpath --path --windows "$MAVEN_PROJECTBASEDIR"`[m
[32m+[m[32mfi[m
[32m+[m
[32m+[m[32mWRAPPER_LAUNCHER=org.apache.maven.wrapper.MavenWrapperMain[m
[32m+[m
[32m+[m[32mexec "$JAVACMD" \[m
[32m+[m[32m  $MAVEN_OPTS \[m
[32m+[m[32m  -classpath "$MAVEN_PROJECTBASEDIR/.mvn/wrapper/maven-wrapper.jar" \[m
[32m+[m[32m  "-Dmaven.home=${M2_HOME}" "-Dmaven.multiModuleProjectDirectory=${MAVEN_PROJECTBASEDIR}" \[m
[32m+[m[32m  ${WRAPPER_LAUNCHER} $MAVEN_CONFIG "$@"[m
[1mdiff --git a/mvnw.cmd b/mvnw.cmd[m
[1mnew file mode 100644[m
[1mindex 0000000..fef5a8f[m
[1m--- /dev/null[m
[1m+++ b/mvnw.cmd[m
[36m@@ -0,0 +1,161 @@[m
[32m+[m[32m@REM ----------------------------------------------------------------------------[m
[32m+[m[32m@REM Licensed to the Apache Software Foundation (ASF) under one[m
[32m+[m[32m@REM or more contributor license agreements.  See the NOTICE file[m
[32m+[m[32m@REM distributed with this work for additional information[m
[32m+[m[32m@REM regarding copyright ownership.  The ASF licenses this file[m
[32m+[m[32m@REM to you under the Apache License, Version 2.0 (the[m
[32m+[m[32m@REM "License"); you may not use this file except in compliance[m
[32m+[m[32m@REM with the License.  You may obtain a copy of the License at[m
[32m+[m[32m@REM[m
[32m+[m[32m@REM    https://www.apache.org/licenses/LICENSE-2.0[m
[32m+[m[32m@REM[m
[32m+[m[32m@REM Unless required by applicable law or agreed to in writing,[m
[32m+[m[32m@REM software distributed under the License is distributed on an[m
[32m+[m[32m@REM "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY[m
[32m+[m[32m@REM KIND, either express or implied.  See the License for the[m
[32m+[m[32m@REM specific language governing permissions and limitations[m
[32m+[m[32m@REM under the License.[m
[32m+[m[32m@REM ----------------------------------------------------------------------------[m
[32m+[m
[32m+[m[32m@REM ----------------------------------------------------------------------------[m
[32m+[m[32m@REM Maven2 Start Up Batch script[m
[32m+[m[32m@REM[m
[32m+[m[32m@REM Required ENV vars:[m
[32m+[m[32m@REM JAVA_HOME - location of a JDK home dir[m
[32m+[m[32m@REM[m
[32m+[m[32m@REM Optional ENV vars[m
[32m+[m[32m@REM M2_HOME - location of maven2's installed home dir[m
[32m+[m[32m@REM MAVEN_BATCH_ECHO - set to 'on' to enable the echoing of the batch commands[m
[32m+[m[32m@REM MAVEN_BATCH_PAUSE - set to 'on' to wait for a key stroke before ending[m
[32m+[m[32m@REM MAVEN_OPTS - parameters passed to the Java VM when running Maven[m
[32m+[m[32m@REM     e.g. to debug Maven itself, use[m
[32m+[m[32m@REM set MAVEN_OPTS=-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=8000[m
[32m+[m[32m@REM MAVEN_SKIP_RC - flag to disable loading of mavenrc files[m
[32m+[m[32m@REM ----------------------------------------------------------------------------[m
[32m+[m
[32m+[m[32m@REM Begin all REM lines with '@' in case MAVEN_BATCH_ECHO is 'on'[m
[32m+[m[32m@echo off[m
[32m+[m[32m@REM set title of command window[m
[32m+[m[32mtitle %0[m
[32m+[m[32m@REM enable echoing my setting MAVEN_BATCH_ECHO to 'on'[m
[32m+[m[32m@if "%MAVEN_BATCH_ECHO%" == "on"  echo %MAVEN_BATCH_ECHO%[m
[32m+[m
[32m+[m[32m@REM set %HOME% to equivalent of $HOME[m
[32m+[m[32mif "%HOME%" == "" (set "HOME=%HOMEDRIVE%%HOMEPATH%")[m
[32m+[m
[32m+[m[32m@REM Execute a user defined script before this one[m
[32m+[m[32mif not "%MAVEN_SKIP_RC%" == "" goto skipRcPre[m
[32m+[m[32m@REM check for pre script, once with legacy .bat ending and once with .cmd ending[m
[32m+[m[32mif exist "%HOME%\mavenrc_pre.bat" call "%HOME%\mavenrc_pre.bat"[m
[32m+[m[32mif exist "%HOME%\mavenrc_pre.cmd" call "%HOME%\mavenrc_pre.cmd"[m
[32m+[m[32m:skipRcPre[m
[32m+[m
[32m+[m[32m@setlocal[m
[32m+[m
[32m+[m[32mset ERROR_CODE=0[m
[32m+[m
[32m+[m[32m@REM To isolate internal variables from possible post scripts, we use another setlocal[m
[32m+[m[32m@setlocal[m
[32m+[m
[32m+[m[32m@REM ==== START VALIDATION ====[m
[32m+[m[32mif not "%JAVA_HOME%" == "" goto OkJHome[m
[32m+[m
[32m+[m[32mecho.[m
[32m+[m[32mecho Error: JAVA_HOME not found in your environment. >&2[m
[32m+[m[32mecho Please set the JAVA_HOME variable in your environment to match the >&2[m
[32m+[m[32mecho location of your Java installation. >&2[m
[32m+[m[32mecho.[m
[32m+[m[32mgoto error[m
[32m+[m
[32m+[m[32m:OkJHome[m
[32m+[m[32mif exist "%JAVA_HOME%\bin\java.exe" goto init[m
[32m+[m
[32m+[m[32mecho.[m
[32m+[m[32mecho Error: JAVA_HOME is set to an invalid directory. >&2[m
[32m+[m[32mecho JAVA_HOME = "%JAVA_HOME%" >&2[m
[32m+[m[32mecho Please set the JAVA_HOME variable in your environment to match the >&2[m
[32m+[m[32mecho location of your Java installation. >&2[m
[32m+[m[32mecho.[m
[32m+[m[32mgoto error[m
[32m+[m
[32m+[m[32m@REM ==== END VALIDATION ====[m
[32m+[m
[32m+[m[32m:init[m
[32m+[m
[32m+[m[32m@REM Find the project base dir, i.e. the directory that contains the folder ".mvn".[m
[32m+[m[32m@REM Fallback to current working directory if not found.[m
[32m+[m
[32m+[m[32mset MAVEN_PROJECTBASEDIR=%MAVEN_BASEDIR%[m
[32m+[m[32mIF NOT "%MAVEN_PROJECTBASEDIR%"=="" goto endDetectBaseDir[m
[32m+[m
[32m+[m[32mset EXEC_DIR=%CD%[m
[32m+[m[32mset WDIR=%EXEC_DIR%[m
[32m+[m[32m:findBaseDir[m
[32m+[m[32mIF EXIST "%WDIR%"\.mvn goto baseDirFound[m
[32m+[m[32mcd ..[m
[32m+[m[32mIF "%WDIR%"=="%CD%" goto baseDirNotFound[m
[32m+[m[32mset WDIR=%CD%[m
[32m+[m[32mgoto findBaseDir[m
[32m+[m
[32m+[m[32m:baseDirFound[m
[32m+[m[32mset MAVEN_PROJECTBASEDIR=%WDIR%[m
[32m+[m[32mcd "%EXEC_DIR%"[m
[32m+[m[32mgoto endDetectBaseDir[m
[32m+[m
[32m+[m[32m:baseDirNotFound[m
[32m+[m[32mset MAVEN_PROJECTBASEDIR=%EXEC_DIR%[m
[32m+[m[32mcd "%EXEC_DIR%"[m
[32m+[m
[32m+[m[32m:endDetectBaseDir[m
[32m+[m
[32m+[m[32mIF NOT EXIST "%MAVEN_PROJECTBASEDIR%\.mvn\jvm.config" goto endReadAdditionalConfig[m
[32m+[m
[32m+[m[32m@setlocal EnableExtensions EnableDelayedExpansion[m
[32m+[m[32mfor /F "usebackq delims=" %%a in ("%MAVEN_PROJECTBASEDIR%\.mvn\jvm.config") do set JVM_CONFIG_MAVEN_PROPS=!JVM_CONFIG_MAVEN_PROPS! %%a[m
[32m+[m[32m@endlocal & set JVM_CONFIG_MAVEN_PROPS=%JVM_CONFIG_MAVEN_PROPS%[m
[32m+[m
[32m+[m