pipeline {
    agent any
    
    environment {
        ROBOT_OPTIONS = "--outputdir results"  // Diretório onde os resultados dos testes serão salvos
    }

    stages {
        stage('Preparar Ambiente') {
            steps {
                echo "Instalando dependências..."
                sh 'pip install -r requirements.txt'  // Instala dependências listadas no arquivo requirements.txt
            }
        }
        
        stage('Executar Testes') {
            steps {
                echo "Executando testes do Robot Framework..."
                // Executa o teste com o arquivo principal do Robot Framework
                sh "robot ${ROBOT_OPTIONS} -d results inspira_smoke.robot"  // Substitua "inspira_tests.robot" pelo nome do seu arquivo principal de testes
            }
        }
    }

    post {
        always {
            echo "Arquivando resultados dos testes..."
            archiveArtifacts artifacts: 'results/*.xml'
            publishHTML(target: [
                allowMissing: true,
                alwaysLinkToLastBuild: true,
                keepAll: true,
                reportDir: 'results',
                reportFiles: 'report.html',
                reportName: 'Relatório do Robot Framework'
            ])
        }
        
        failure {
            echo "Alguns testes falharam."
        }
    }
}
