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

    stage('artifacts'){
        archiveArtifacts artifacts: '*.sh'
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
             def scannerHome = tool name: 'sonarscanner';
             sh 'export SONAR_SCANNER_OPTS="-Xmx512m"'
             sh 'set SONAR_SCANNER_OPTS=-Xmx512m'
             sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=saiveerateja-1 -Dsonar.sources=. -Dsonar.host.url=http://3.134.62.65:9000 -Dsonar.login=sqp_b9ff24ff10c8f71ac7a0c7fd1957c1945f631b02"
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

    stage('Build status'){
        office365ConnectorSend message: 'started ${env.JOB_NAME} ${env.BUILD_NUMBER}', status: 'we will find it soon', webhookUrl: 'https://tataelxsi.webhook.office.com/webhookb2/112576e0-aa18-4f8d-9756-2f307c5fcc6a@ad6a39dd-96b6-4368-82da-f2ec4d92e26a/JenkinsCI/01f6fc8f4e9842db95fd6b91fbaa24b9/fe8cb175-cc6b-4f79-b8bd-2a3d65c75354'
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


