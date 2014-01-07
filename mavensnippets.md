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
