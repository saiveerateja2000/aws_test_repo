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
    stage('Trigger1') {
            def currentHour = new Date().format('H', TimeZone.getTimeZone('UTC'))
            def currentDay = new Date().format('u', TimeZone.getTimeZone('UTC'))
                    sh 'echo "${currentHour}" '
                    sh 'echo "${currentDay}" '
                    sh 'echo "timely trigger 1 is happening"'
            
    }
    stage('Trigger2') {
            def currentHour = new Date().format('H', TimeZone.getTimeZone('UTC'))
            def currentDay = new Date().format('u', TimeZone.getTimeZone('UTC'))
                    sh 'echo "timely trigger 2 is happening"'
    }
    stage('SonarQube Analysis-2') {
         //def scannerHome = tool 'sonar-scanner';
         //withSonarQubeEnv(installationName:'sonarqube') {
              //sh "sonar-scanner -Dsonar.projectKey=sai-teja-test"
             //sh 'export SONAR_SCANNER_OPTS="-Djava.io.tmpdir=/tmp/sonar" '
             //sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=saiveerateja-1" 
             //def scannerHome = tool name: 'sonarscanner';
             //sh 'export SONAR_SCANNER_OPTS="-Xmx512m"'
             //sh 'set SONAR_SCANNER_OPTS=-Xmx512m'
             //sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=saiveerateja-1 -Dsonar.sources=. -Dsonar.host.url=http://3.134.62.65:9000 -Dsonar.login=sqp_b9ff24ff10c8f71ac7a0c7fd1957c1945f631b02"
            //sh 'docker run --rm -e SONAR_HOST_URL="http://3.134.62.65:9000" -e SONAR_SCANNER_OPTS="-Dsonar.projectKey=sai-teja-test" -e   SONAR_TOKEN="sqp_b1277ca14e38f178671c2a7cd999ba61b2a20282" -v /var/lib/jenkins/workspace/sonar:/usr/src -v /var/lib/jenkins/workspace/sonar/coverage.xml:/usr/src/coverge.xml sonarsource/sonar-scanner-cli'
            //sh 'docker run --rm -e SONAR_HOST_URL="http://3.134.62.65:9000" -e SONAR_SCANNER_OPTS="-Dsonar.projectKey=sai-teja-test" -e   SONAR_TOKEN="sqp_b1277ca14e38f178671c2a7cd999ba61b2a20282" -v /var/lib/jenkins/workspace/sonar:/usr/src -v /var/lib/jenkins/workspace/sonar/coverage.xml:/usr/src/coverge.xml sonarsource/sonar-scanner-cli'
            //sh 'docker run --rm -e SONAR_HOST_URL="http://3.134.62.65:9000" -e SONAR_SCANNER_OPTS="-Dsonar.projectKey=saiveerateja-2" -e SONAR_TOKEN="sqp_ed511176bed7b39c7d62d3441c358b29ec218d61" -v .:/usr/src -v ./coverage.xml:/usr/src/coverge.xml sonarsource/sonar-scanner-cli'
            sh 'docker run --rm -e SONAR_HOST_URL="http://3.134.62.65:9000" -e SONAR_SCANNER_OPTS="-Dsonar.projectKey=saiveerateja-3" -e SONAR_TOKEN=sqp_fb5ec4abfc59ef60029cb0a2d9635515fbf019e0 -v .:/usr/src sonarsource/sonar-scanner-cli'
       // sh 'docker run --rm -e SONAR_HOST_URL="http://3.134.62.65:9000" -e SONAR_SCANNER_OPTS="-Dsonar.projectKey=saiveerateja-3" -e SONAR_TOKEN=sqp_fb5ec4abfc59ef60029cb0a2d9635515fbf019e0 -v .:/usr/src -v .:/usr/src/.scannerwork sonarsource/sonar-scanner-cli'
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
}
catch(exc){
    echo "something went wrong"
    throw exc
}
finally {
    //def webhookUrl = 'https://tataelxsi.webhook.office.com/webhookb2/112576e0-aa18-4f8d-9756-2f307c5fcc6a@ad6a39dd-96b6-4368-82da-f2ec4d92e26a/IncomingWebhook/e3d54ab95f0a4dbe8193c45faafdc657/fe8cb175-cc6b-4f79-b8bd-2a3d65c75354'
    def webhookUrl = 'https://tataelxsi.webhook.office.com/webhookb2/cf5d8d3b-8722-434e-afa9-c6ddcf49290d@ad6a39dd-96b6-4368-82da-f2ec4d92e26a/IncomingWebhook/268c72baf05d4c8bbc8d6a948e9cc7bb/fe8cb175-cc6b-4f79-b8bd-2a3d65c75354'
    stage('Artifacts'){
        sh "curl -u squ_d5dd49a1d2943a80b8a12094229b8f96de728851: -o reports.zip -X GET 'http://3.134.62.65:9000/api/cnesreport/report?key=saiveerateja-2&branch=main&language=en_US&author=Administrator&token=squ_d5dd49a1d2943a80b8a12094229b8f96de728851&enableDocx=true&enableMd=true&enableXlsx=true&enableCsv=true&enableConf=true&generation=Generate' "
        sh 'curl -u sqp_ed511176bed7b39c7d62d3441c358b29ec218d61: -X GET "http://3.134.62.65:9000/api/issues/search?componentKeys=saiveerateja-2&resolved=false&ps=500&format=json" -o issues.json'
        //archiveArtifacts artifacts: '*.zip,*.json'
        def message = "Build ${env.BUILD_NUMBER} is completed. [Click here for Artifacts](http://3.134.62.65/files/saitejaisgoodperson/${env.BUILD_NUMBER}/archive/)."
        //sh """
            //curl -X POST -H 'Content-Type: application/json' -d '{
                //"text": "${message}"
            //}' ${webhookUrl}
            //"""
        sh """
            curl -X POST -H "Content-Type: application/json" -d '{"text": "${message}"}' '${webhookUrl}'
        """


    }
   
    stage('Build status'){
        def statusMessage = "Job ${env.JOB_NAME} ${env.BUILD_NUMBER} completed. "
            statusMessage += (currentBuild.result == 'FAILURE') ? "Secrets were detected." : "No secrets were detected."
            statusMessage += "\n[Download the Gitleaks report](www.google.com)"
         office365ConnectorSend message: statusMessage , status: currentBuild.result , webhookUrl: 'https://tataelxsi.webhook.office.com/webhookb2/112576e0-aa18-4f8d-9756-2f307c5fcc6a@ad6a39dd-96b6-4368-82da-f2ec4d92e26a/JenkinsCI/01f6fc8f4e9842db95fd6b91fbaa24b9/fe8cb175-cc6b-4f79-b8bd-2a3d65c75354'
    }
    stage('Build status2') {
        def statusMessage = "Job ${env.JOB_NAME} ${env.BUILD_NUMBER} completed."
        def buildStatus = currentBuild.result ?: 'SUCCESS'  // Default to 'SUCCESS' if result is null
        office365ConnectorSend message: statusMessage, status: buildStatus, webhookUrl: 'https://tataelxsi.webhook.office.com/webhookb2/cf5d8d3b-8722-434e-afa9-c6ddcf49290d@ad6a39dd-96b6-4368-82da-f2ec4d92e26a/JenkinsCI/d6db7667801c4375ad493ee58ad905be/fe8cb175-cc6b-4f79-b8bd-2a3d65c75354'
}

}
}
