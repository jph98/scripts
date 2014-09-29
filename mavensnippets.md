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

	    mvn archetype:generate -DarchetypeGroupId=org.apache.maven.archetypes -DarchetypeArtifactId=maven-archetype-webapp -DgroupId=com.froyo -DartifactId=skeletonwebapp  

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
			
Specifying the final name
-------------------------

	<build>
        	<finalName>helloworldservlet</finalName>
    	</build>

Maven Executable JAR with Assembly Plugin
-----------------------------------------

	<build>
		<plugins>
			<plugin>
				<groupId>org.apache.maven.plugins</groupId>
				<artifactId>maven-assembly-plugin</artifactId>
				<version>2.2-beta-5</version>
				<configuration>
					<descriptorRefs>
						<descriptorRef>jar-with-dependencies</descriptorRef>
					</descriptorRefs>
					<archive>
						<manifest>
							<mainClass>com.application.MainApplication</mainClass>
						</manifest>
					</archive>
				</configuration>
			</plugin>
		</plugins>
	</build>
	
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

Running tests AFTER the packaging phase
---------------------------------------

	
		<plugin>
	            <groupId>org.apache.maven.plugins</groupId>
	            <artifactId>maven-surefire-plugin</artifactId>
	            <configuration>
	                <skip>true</skip>
	            </configuration>
	            <executions>
	                <execution>
	                    <id>unittests</id>
	                    <phase>package</phase>
	                    <goals>
	                        <goal>test</goal>
	                    </goals>
	                    <configuration>
	                        <skip>false</skip>
	                        <includes>
	                            <include>**/**/**/*Test.java</include>
	                        </includes>
	                    </configuration>
	                </execution>
	            </executions>
	        </plugin>

Filtering a Resource
--------------------

	
			<plugin>
				<groupId>org.apache.maven.plugins</groupId>
				<artifactId>maven-resources-plugin</artifactId>
				<version>2.4.3</version>
				<executions>
					<execution>
						<id>copy-resources</id>
						<phase>validate</phase>
						<goals>
							<goal>copy-resources</goal>
						</goals>
						<configuration>
							<outputDirectory>${basedir}/target</outputDirectory>
							<resources>
							
								<!-- Installation scripts and properties files -->
								<resource>
									<filtering>true</filtering>
									<directory>src/main/java/install</directory>
									<includes>
										<include>**/*.properties</include>
										<include>**/*.sh</include>
									</includes>
								</resource>															
								
							</resources>
							<encoding>UTF-8</encoding>
						</configuration>
					</execution>
				</executions>
			</plugin>

Creating an executable Tomcat web application JAR
-------------------------------------------------

	<plugin>
				<groupId>org.apache.tomcat.maven</groupId>
				<artifactId>tomcat7-maven-plugin</artifactId>
				<version>2.0</version>

				<!-- Executable JAR -->
				<executions>

					<execution>
						<id>tomcat-run</id>
						<goals>
							<goal>exec-war-only</goal>
						</goals>
						<phase>package</phase>
						<configuration>
							<path>/</path>
							<enableNaming>false</enableNaming>
							<httpPort>9001</httpPort>
							<port>9001</port>
							<finalName>rexecutionservice-executable.jar</finalName>
							<charset>utf-8</charset>
							<attachArtifactClassifier>executable</attachArtifactClassifier>
							<attachArtifactClassifierType>jar</attachArtifactClassifierType>
						</configuration>
					</execution>
				</executions>

Deleting additional resources with clean 
----------------------------------------

			</plugin>

			<plugin>
			    <artifactId>maven-clean-plugin</artifactId>
			    <version>2.5</version>
			    <configuration>
			      <filesets>
			        <fileset>
			          <directory>${basedir}</directory>
			          <includes>
			            <include>tomcat**/**</include>
			            <include>work</include>
			            <include>target</include>
			          </includes>
			          <followSymlinks>false</followSymlinks>
			        </fileset>
			      </filesets>
			    </configuration>
			  </plugin>

Running a Bash Script From Maven
--------------------------------

		 <plugin>
                        <groupId>com.atlassian.maven.plugins</groupId>
                        <artifactId>bash-maven-plugin</artifactId>
                        <version>1.0</version>
                        <executions>
                            <execution>
                                <id>Deploy service to dev</id>
                                <phase>pre-integration-test</phase>
                                <goals>
                                    <goal>run</goal>
                                </goals>
                            </execution>
                        </executions>
                        <configuration>
                            <script>
                                echo "Hello World"
                            </script>
                        </configuration>
                    </plugin>

