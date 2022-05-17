pipeline {
 agent any
   stages {
    stage('clone'){
      steps {
        git url: 'https://github.com/NicolasWattiez/tp_ci_cd'
      }
    }
	  stage ('tp5_free - Build - Purge') {
      tools {
        gradle 'gradle'
      }
      steps {
        sh 'gradle purge'
        sh 'gradle dependencies'
        sh 'gradle packageDistribution'
      }
	  }
}

