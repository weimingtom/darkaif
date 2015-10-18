Information:
To able to compile flex sdk. It took a while to look around. But there are different way to build it. As long you know how the ant build works.

![http://darkaif.googlecode.com/svn/trunk/images/eclipseflashworkspace_foo.jpg](http://darkaif.googlecode.com/svn/trunk/images/eclipseflashworkspace_foo.jpg)

The layout will look like this.

build.xml
```
<?xml version="1.0" encoding="utf-8"?>
<project name='flash swf compiler' default='as'>

	<!-- Declares references to needed directories. -->
	  <property name="src.dir" location="src"/>
	  <property name="lib.dir" location="lib"/>
	  <property name="bin.dir" location="bin"/>

  <target name='as'>
    <property name='compiler' location='C:\flex_sdk_3\bin\mxmlc.exe' />
  	<property name="ASFile" value="${src.dir}\Foo.as"/>
  	<property name="SWFFile" value="${bin.dir}\Foo.swf"/>
  	<property name="classPath" value="${src.dir}"/>
  	<property name="screen" value="-default-size 508 308"/>
    <exec executable='${compiler}' failonerror='true'>
    	<arg line='"${ASFile}" ${screen} -output "${SWFFile}"'/>  
    </exec>
    <echo>mxml file compiled successfully</echo>
    <echo>swf file generated successfully</echo>
  </target>
</project>
```

buildflashplayer.xml
```
<?xml version="1.0" encoding="utf-8"?>
<project name='flasheclipse' default='as'>

	<!-- Declares references to needed directories. -->
	<property name="src.dir" location="src"/>
	<property name="lib.dir" location="lib"/>
	<property name="bin.dir" location="bin"/>
	<property name="build.dir" location="build"/>

	<target name='as'>
  		<property name="flashplayer" location="C:\flex_sdk_3\runtimes\player\10\win\FlashPlayer.exe"/>
		<property name='compiler' location='C:\flex_sdk_3\bin\mxmlc.exe' />
		<property name="ASFile" value="${src.dir}\ShowText.as"/>
		<property name="SWFFile" value="${bin.dir}\Foo.swf"/>
		<property name="classPath" value="${src.dir}"/>
		<property name="screen" value="-default-size 508 308"/>
		<exec executable='${compiler}' failonerror='true'>
    		<arg line='"${ASFile}" ${screen} -output "${SWFFile}"'/>    	
    	</exec>
		<echo>mxml file compiled successfully</echo>
		<echo>swf file generated successfully</echo>
  	
		<exec executable='${flashplayer}' failonerror='true'>
			<arg line='"${SWFFile}"'/>    	
		</exec>
	</target>
</project>
```