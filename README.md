# Flutter Skill Playground

Um playground interativo que demonstra diversas funcionalidades avançadas do Flutter, incluindo CustomPainter, Router 2.0, BLoC, Platform Channels, Isolates, Animações, StreamBuilder e muito mais.

## 🚀 Tecnologias Utilizadas

- **Linguagem**: Dart
- **Framework**: Flutter
- **Gerenciamento de Estado**: BLoC (flutter_bloc)
- **Injeção de Dependência**: GetIt
- **Navegação**: Router 2.0 (Custom Router Delegate)
- **Fontes**: Google Fonts
- **Testes**: Mocktail, bloc_test
- **Utilitários**: Equatable, Gap, Decimal

## 📱 Funcionalidades Demonstradas

### CustomPainter Screen
- Implementação de CustomPainter personalizado
- Representação da logo da For People
- Demonstração de ClipPath e CustomPaint

### Router 2.0 Screen
- Implementação completa do Router 2.0
- RouterDelegate customizado com histórico de navegação
- RouteInformationParser para parsing de URLs

### BLoC State Management
- Implementação do padrão BLoC
- Gerenciamento de estado reativo
- Eventos e estados bem definidos
- Counter simples com incremento/decremento

### Platform Channels
- Comunicação entre Flutter e código nativo
- Serviços de plataforma
- Integração com APIs nativas

### Performance Screen
- Otimizações de performance
- RepaintBoundary para isolamento de repaints
- Lazy loading e otimizações de memória

### Isolate Screen
- Cálculo de Pi usando Isolates
- Algoritmo Chudnovsky para cálculo de Pi
- Processamento em Isolate
- Progress tracking e UI responsiva

### Animation Screen
- Múltiplos AnimationControllers
- Animações sequenciais e coordenadas
- RepaintBoundary para otimização

### StreamBuilder Screen
- Tratamento de erros em Streams
- StreamSubscription management
- Estados de conexão e erro
- Recuperação de erros

### Sliver Screen
- Implementação de Slivers
- ScrollView customizado
- Layouts adaptativos

### Dependency Injection Screen
- Padrão de injeção de dependência
- GetIt para service locator
- Registro de serviços singleton

## Arquitetura do Projeto

O projeto segue uma arquitetura limpa (Clean Architecture) com separação clara de responsabilidades:

```
lib/
    data/ # Camada de Dados
        services/ # Serviços (Logging, Platform)
    domain/ # Camada de Domínio
        components/ # Componentes reutilizáveis
            grid_delegates/ # Delegates customizados
            painters/ # CustomPainters
        models/ # Modelos de dados
        usecases/ # Casos de uso
    presentation/ # Camada de Apresentação
        blocs/ # Gerenciamento de estado
        router/ # Navegação Router 2.0
        screens/ # Telas da aplicação
        widgets/ # Widgets reutilizáveis
    locator.dart # Configuração de DI
```

## 🛠️ Instalação e Uso

### Pré-requisitos
- Flutter SDK (Stable)
- Dart SDK 3.9.0 ou superior
- Android Studio / VS Code
- Git

### Passos para instalação

1. **Clone o repositório**
```bash
git clone https://github.com/VitorPaulo21/flutter_skill_playground.git
cd flutter_skill_playground
```

2. **Instale as dependências**
```bash
flutter pub get
```

3. **Execute o projeto**
```bash
flutter run
```

### Comandos úteis

```bash
# Executar testes
flutter test

# Análise de código
flutter analyze

# Limpar build
flutter clean

# Atualizar dependências
flutter pub upgrade
```

## Pacotes Utilizados

### Dependências Principais
- `flutter_bloc: ^9.1.1` - Gerenciamento de estado
- `get_it: ^8.2.0` - Injeção de dependência
- `get: ^4.7.2` - Utilitários e navegação
- `google_fonts: ^6.3.1` - Fontes do Google
- `decimal: ^3.2.4` - Precisão decimal
- `gap: ^3.0.1` - Espaçamento
- `equatable: ^2.0.7` - Comparação de objetos

### Dependências de Desenvolvimento
- `flutter_lints: ^5.0.0` - Linting
- `mocktail: ^1.0.4` - Mocking para testes
- `bloc_test: ^10.0.0` - Testes de BLoC

## 🎯 Decisões de Arquitetura

### 1. Clean Architecture
**Decisão**: Implementação de Clean Architecture com separação em camadas
**Justificativa**: 
- Facilita manutenção e testes
- Separação clara de responsabilidades
- Código mais legível e organizável

### 2. Router 2.0 Customizado
**Decisão**: Implementação de RouterDelegate e RouteInformationParser customizados
**Justificativa**:
- Controle total sobre navegação
- Suporte a deep linking
- Histórico de navegação personalizado

### 3. BLoC para Gerenciamento de Estado
**Decisão**: Uso do padrão BLoC ao invés de Provider ou setState
**Justificativa**:
- Estado previsível e testável
- Separação clara entre UI e lógica de negócio
- Facilita debugging e manutenção
- Padrão recomendado para aplicações complexas

### 4. GetIt para Injeção de Dependência
**Decisão**: Uso do GetIt ao invés de Provider para DI
**Justificativa**:
- Mais leve que Provider
- Configuração simples
- Suporte a singletons
- Melhor performance

## 🚧 Desafios Encontrados e Soluções

### 1. Implementação do Router 2.0
**Desafio**: Configuração complexa do RouterDelegate e RouteInformationParser
**Solução**: 
- Criação de enum para rotas tipadas
- Implementação de histórico de navegação
- Métodos push/pop/replace bem definidos

### 2. Cálculo de Pi com Isolates
**Desafio**: Processamento pesado na UI thread
**Solução**:
- Implementação do algoritmo Chudnovsky
- Callback de progresso para UI responsiva
- Binary splitting para otimização

### 3. Animações Complexas
**Desafio**: Coordenação de múltiplas animações
**Solução**:
- Múltiplos AnimationControllers gerados por lista
- StatusListeners para sincronização
- RepaintBoundary para otimização

### 5. CustomPainter Performance
**Desafio**: Otimização de repaints e formas especificas
**Solução**:
- shouldRepaint otimizado
- ClipPath para formas específicas
- Cálculos matemáticos

## 🧪 Testes

O projeto inclui estrutura para testes com:
- `bloc_test` para testes de BLoC
- `mocktail` para mocking
- Estrutura de pastas organizada para testes

```bash
# Executar todos os testes
flutter test

# Executar testes com cobertura
flutter test --coverage
```

## Plataformas Suportadas

- ✅ Android
- ✅ iOS

## Licença

Este projeto é um challenge by [Coodesh](https://coodesh.com/)

---