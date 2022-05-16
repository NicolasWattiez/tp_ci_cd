// Powered by Infostretch 

timestamps {

node () {

	stage ('tp5_free - Checkout') {
 	 checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '', url: 'https://github.com/NicolasWattiez/tp_ci_cd']]]) 
	}
	stage ('tp5_free - Build - Purge') {
        script {
            def version = sh (
                script: "/var/jenkins_home/tools/hudson.plugins.gradle.GradleInstallation/gradle/bin/gradle purge",
                returnStdout: true
            ).trim()
            sh "echo purge old build"
        }
	}
	stage ('tp5_free - Build - Dependencies') {
        script {
            def version = sh (
                script: "/var/jenkins_home/tools/hudson.plugins.gradle.GradleInstallation/gradle/bin/gradle dependencies",
                returnStdout: true
            ).trim()
            sh "echo install dependancies"
        }
	}
	stage ('tp5_free - Build - package') {
        script {
            def version = sh (
                script: "/var/jenkins_home/tools/hudson.plugins.gradle.GradleInstallation/gradle/bin/gradle packageDistribution",
                returnStdout: true
            ).trim()
            sh "echo install dependancies"
        }
	}
}
}
