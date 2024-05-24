node {
    def groovyfile = null
try{
    stage('Checkout') {
        // Checkout source code from Git repository
        sh 'echo "cloning the code" '
        git branch: 'main', url: 'https://github.com/saiveerateja2000/aws_test_repo.git'
        ///sh "java -version"
    }

    stage('Build') {
        sh 'echo "loading groovyfile" '
        // Attempt to load groovyfile
        groovyfile = load 'atom.groovy'
        // If groovyfile is null, abort the stage
        if (groovyfile == null) {
            error("Failed to load groovyfile. Aborting the stage.")
        }
    }

    stage('SonarQube Analysis') {
        // Run SonarQube analysis
        withSonarQubeEnv('sonarqube') {
            sh "echo 'hello world' "
            sh 'pwd'
        }
    }
    stage('SonarQube Analysis-2') {
         //def scannerHome = tool 'sonar-scanner';
         withSonarQubeEnv(installationName:'sonarqube') {
              //sh "sonar-scanner -Dsonar.projectKey=sai-teja-test"
             //sh 'export SONAR_SCANNER_OPTS="-Djava.io.tmpdir=/tmp/sonar" '
             //sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=saiveerateja-1" 
             def scannerHome = tool name: 'sonarscanner', type: 'hudson.plugins.sonar.SonarRunnerInstallation';
             sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=saiveerateja-1 -Dsonar.java.binaries= **/*.java"
            //sh 'docker run --rm -e SONAR_HOST_URL="http://3.134.62.65:9000" -e SONAR_SCANNER_OPTS="-Dsonar.projectKey=sai-teja-test" -e   SONAR_TOKEN="sqp_b1277ca14e38f178671c2a7cd999ba61b2a20282" -v /var/lib/jenkins/workspace/sonar:/usr/src -v /var/lib/jenkins/workspace/sonar/coverage.xml:/usr/src/coverge.xml sonarsource/sonar-scanner-cli'
            //sh 'docker run --rm -e SONAR_HOST_URL="http://3.134.62.65:9000" -e SONAR_SCANNER_OPTS="-Dsonar.projectKey=sai-teja-test" -e   SONAR_TOKEN="sqp_b1277ca14e38f178671c2a7cd999ba61b2a20282" -v /var/lib/jenkins/workspace/sonar:/usr/src -v /var/lib/jenkins/workspace/sonar/coverage.xml:/usr/src/coverge.xml sonarsource/sonar-scanner-cli'
         }
    }

    stage('Test') {
        // Run tests (example: JUnit)
        sh 'echo "hello3" '
        try {
            groovyfile.building()
            sh "echo 'Current build result2: ${currentBuild.currentResult}' "
            currentBuild.result = 'SUCCESS'
            sh "echo 'Current build result3: ${currentBuild.result}' "
        } catch(e) {
            echo 'An error occurred during unit testing. Aborting pipeline.'
            currentBuild.result = 'ABORTED'
            throw e
        }
    }

    if (currentBuild.result == 'SUCCESS') {
        stage('Success') {
            // Deploy the application (example: Docker)
            echo "hello4"
        }
    }else {
        stage('Failure') {
            echo 'aborted'
        }
    }
}catch(exc){
    echo "something went wrong"
    throw exc}
}


