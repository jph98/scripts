Maven Exec Plugin - Executing a Class With Arguments
----------------------------------------------------

Maven Executable JAR
--------------------


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
