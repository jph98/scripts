Maven Plugin Cookbook  - http://maven.apache.org/plugin-developers/cookbook/

Useful Commands
---------------

Dependencies:

	mvn dependency:tree
	
Skip Tests:

	mvn package -DskipTests=true

Display updates required:

	mvn versions:display-plugin-updates
	mvn versions:display-dependency-updates

Build only required projects:

	mvn -pl ejb,ear package
	
Resume build from last test

	mvn -rf myproject-commons clean install
	
Offline compile:

	    mvn -o compile  

Run one test:

	    mvn test –Dtest=org.shankh.mavenTest  
	    
Archetypes
----------

Create a web app:

	    mvn archetype:generate  
            -DarchetypeGroupId=org.apache.maven.archetypes  
            -DarchetypeArtifactId=maven-archetype-webapp  
            -DgroupId=com.mycompany  
            -DartifactId=my-app  

Download Sources and Javadoc
----------------------------

    <plugin>
        <groupId>org.apache.maven.plugins</groupId>
		<artifactId>maven-eclipse-plugin</artifactId>
		<configuration>
			<downloadSources>true</downloadSources>
			<downloadJavadocs>true</downloadJavadocs>
		</configuration>
	</plugin>
			
Maven Exec Plugin
-----------------

Binds to mvn exec:exec

    <plugin>
            <groupId>org.codehaus.mojo</groupId>
            <artifactId>exec-maven-plugin</artifactId>
            <version>1.2.1</version>                                
            <configuration>
                    <executable>java</executable>                                        
                    <arguments>
                            <argument>-Djava.library.path=${project.build.directory}/lib</argument>
                <argument>-classpath</argument>
                            <classpath />
                            <argument>akka.Main</argument>
                            <argument>com.froyo.MyActor</argument>
                    </arguments>
            </configuration>
    </plugin>

Maven Assembly JAR
--------------------

Binds to assembly

  			<plugin>
  				<groupId>org.apache.maven.plugins</groupId>
  				<artifactId>maven-assembly-plugin</artifactId>
  				<version>2.2</version>
  				<configuration>
  					<descriptorRefs>
  						<descriptorRef>jar-with-dependencies</descriptorRef>
  					</descriptorRefs>
  					<archive>
  						<manifest>
  							<mainClass>advws.net.nagios.jmelody.core.CheckJMelody</mainClass>
  						</manifest>
  					</archive>
  				</configuration>
  			</plugin>

Maven Shade JAR
---------------

Binds to package

n.b. This doesn't include system dependencies declared, it omits them.

    <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-shade-plugin</artifactId>
        <version>2.1</version>
        <configuration>
                <finalName>jmxcl</finalName>
                <transformers>
                        <transformer
                                implementation="org.apache.maven.plugins.shade.resource.ManifestResourceTransformer">
                                <mainClass>com.chester.JMXCLI</mainClass>
                        </transformer>
                </transformers>
        </configuration>
        <executions>
                <execution>
                        <phase>package</phase>
                        <goals>
                                <goal>shade</goal>
                        </goals>
                </execution>
        </executions>
    </plugin>

Embedded Tomcat
---------------

<plugin>
				<groupId>org.apache.tomcat.maven</groupId>
				<artifactId>tomcat7-maven-plugin</artifactId>
				<version>2.0</version>

				<!-- Configuration - http://tomcat.apache.org/maven-plugin-2.0/tomcat7-maven-plugin/run-war-mojo.html#tomcatLoggingFile -->
				<configuration>

					<tomcatLoggingFile>${basedir}/log.txt</tomcatLoggingFile>
					<tomcatUsers>${basedir}/src/main/resources/tomcat-users.xml</tomcatUsers>
					<warDirectory>${project.build.directory}</warDirectory>
					<port>${tomcat.port}</port>

					<extraDependencies>
						<dependency>
							<groupId>org.slf4j</groupId>
							<artifactId>slf4j-api</artifactId>
							<version>1.7.2</version>
						</dependency>
						<dependency>
							<groupId>org.slf4j</groupId>
							<artifactId>jul-to-slf4j</artifactId>
							<version>1.7.2</version>
						</dependency>
						<dependency>
							<groupId>ch.qos.logback</groupId>
							<artifactId>logback-classic</artifactId>
							<version>1.0.7</version>
						</dependency>
						<dependency>
							<groupId>ch.qos.logback</groupId>
							<artifactId>logback-core</artifactId>
							<version>1.0.7</version>
						</dependency>
					</extraDependencies>
				</configuration>
		<	/plugin>
		
Creating Multiple Artifacts
---------------------------

Use the assembly plugin:

        <plugin>
				<groupId>org.apache.maven.plugins</groupId>
				<artifactId>maven-assembly-plugin</artifactId>
				<executions>
					<execution>
						<id>create-client-jar</id>
						<phase>package</phase>
						<goals>
							<goal>single</goal>
						</goals>
						<configuration>							
							<descriptors>
								<descriptor>src/main/assembly/api-jar-assembly.xml</descriptor>
								<descriptor>src/main/assembly/service-war-assembly.xml</descriptor>
							</descriptors>
							<archive>								
								<manifestEntries>
									<Built-Date>${maven.build.timestamp}</Built-Date>
									<Build-OS>${os.name}-${os.version}</Build-OS>									
								</manifestEntries>
							</archive>
						</configuration>
					</execution>
				</executions>
			</plugin>            

and specify each assembly descriptor.  

This specifies a JAR with specific directories:

    <assembly xmlns="http://maven.apache.org/plugins/maven-assembly-plugin/assembly/1.1.0" 
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://maven.apache.org/plugins/maven-assembly-plugin/assembly/1.1.0 http://maven.apache.org/xsd/assembly-1.1.0.xsd">
      
      <id>client</id>
      
      <formats>
        <format>jar</format>
      </formats>
      
      <includeBaseDirectory>false</includeBaseDirectory>
      
      <fileSets>
        <fileSet>      
          <outputDirectory>/</outputDirectory>
          <includes>
            <include>**/api/**</include>
            <include>**/client/**</include>
          </includes>
        </fileSet>
      </fileSets>
      
    </assembly>
    
This specifies a WAR file (along with specifying packaging as war in your root pom.xml):

Need to work out how to create an assembly from scratch for a war and publish that instead of using the war plugin

        <assembly
        	xmlns="http://maven.apache.org/plugins/maven-assembly-plugin/assembly/1.1.0"
        	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        	xsi:schemaLocation="http://maven.apache.org/plugins/maven-assembly-plugin/assembly/1.1.0 http://maven.apache.org/xsd/assembly-1.1.0.xsd">
        
        	<id>service</id>
        	<formats>
        		<format>war</format>
        		<format>dir</format>
        	</formats>
        	<includeBaseDirectory>false</includeBaseDirectory>
        	<dependencySets>
        		<dependencySet>
        			<includes>
        				<include>${project.groupId}:*:war:${project.version}</include>
        			</includes>
        			<useProjectArtifact>true</useProjectArtifact>
        			<outputDirectory>webapp</outputDirectory>
        			<unpack>false</unpack>
        		</dependencySet>
        		<dependencySet>
        			<excludes>
        				<exclude>${project.groupId}:*:war:${project.version}</exclude>
        			</excludes>
        			<useProjectArtifact>true</useProjectArtifact>
        			<outputDirectory>lib</outputDirectory>
        			<unpack>false</unpack>
        		</dependencySet>
        	</dependencySets>
        
        </assembly>
