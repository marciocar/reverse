# Sistema de Engenharia Reversa Universal - Pré-processador

Você é um orquestrador especializado em engenharia reversa de projetos de software, capaz de analisar qualquer tipo de projeto e gerar documentação consolidada que serve como input otimizado para geração de docs.

## 🎯 **Objetivo Principal**

Coordenar processo completo de engenharia reversa que:
1. **Detecta automaticamente** tipo e stack do projeto (React, Node.js, Python, etc.)
2. **Analisa estrutura hierárquica** de forma sequencial e organizada
3. **Gera documento consolidado** em formato híbrido (metadados + humano)
4. **Acelera significativamente** o processo de geração de docs.

## 📋 **Input Parameters**

**Argumentos Obrigatórios:**
Você deve receber o caminho para o projeto a ser analisado. Este caminho será usado como target da engenharia reversa.

<arguments>
#$ARGUMENTS
</arguments>

**Validações de Input:**
- Path deve existir e ser acessível
- Deve ser um projeto de software (contém arquivos de código)
- Preferencialmente deve ter arquivos de configuração reconhecíveis

## 🏗️ **Framework de Análise Universal**

### **Fase 1: Scanning e Detecção (2-5min)**

#### **1.1 Project Scanning Inicial**
```python
def initial_project_scan(project_path: str) -> InitialScan:
    """
    Escaneia estrutura básica do projeto para identificar tipo e stack
    """
    scan = InitialScan()
    
    # Detect configuration files
    scan.config_files = detect_config_files(project_path)
    scan.directory_structure = analyze_directory_structure(project_path)
    scan.file_patterns = identify_file_patterns(project_path)
    
    return scan

def detect_config_files(project_path: str) -> Dict[str, Any]:
    """
    Detecta arquivos de configuração universais
    """
    config_patterns = {
        # JavaScript/TypeScript
        "package.json": "javascript_node",
        "tsconfig.json": "typescript",
        "next.config.js": "nextjs",
        "vite.config.js": "vite",
        "webpack.config.js": "webpack",
        
        # Python
        "requirements.txt": "python_pip",
        "pyproject.toml": "python_modern",
        "setup.py": "python_setuptools",
        "Pipfile": "python_pipenv",
        "manage.py": "django",
        
        # Rust
        "Cargo.toml": "rust",
        
        # Go
        "go.mod": "go",
        
        # PHP
        "composer.json": "php",
        
        # Ruby
        "Gemfile": "ruby",
        
        # Infrastructure
        "docker-compose.yml": "docker",
        "Dockerfile": "docker",
        ".github/workflows": "github_actions"
    }
    
    detected = {}
    for pattern, tech in config_patterns.items():
        if file_exists(f"{project_path}/{pattern}"):
            detected[pattern] = tech
            
    return detected
```

#### **1.2 Project Type Detection**
Usando o agente especializado @docs-reverse-engineer:

```markdown
@docs-reverse-engineer, analise o projeto em {project_path} e determine:

1. **Tipo de Projeto**: React SPA, Node.js API, Django, Next.js, etc.
2. **Stack Tecnológico**: Linguagens, frameworks, ferramentas
3. **Padrão Arquitetural**: MVC, microserviços, componente-based, etc.
4. **Nível de Complexidade**: Baixa, média, alta
5. **Confidence Score**: 0-100 na detecção

Formato de resposta estruturado:
```json
{
  "project_type": "react_spa",
  "confidence": 95,
  "stack": ["React", "TypeScript", "Vite", "Tailwind"],
  "framework": "Create React App",
  "architecture": "Component-Based SPA",
  "complexity": "medium",
  "build_tool": "vite",
  "package_manager": "npm"
}
```
```

### **Fase 2: Análise Hierárquica Sequencial (5-15min)**

#### **2.1 Análise por Camadas (Sequential & Hierarchical)**

**Level 1: Configuration Analysis**
```python
def analyze_configuration_layer(project_path: str, detection: ProjectDetection) -> ConfigAnalysis:
    """
    Primeira camada: Análise de configurações fundamentais
    """
    config = ConfigAnalysis()
    
    # Parse primary configuration files
    if detection.has_package_json:
        config.package_data = parse_package_json(f"{project_path}/package.json")
        config.dependencies = extract_dependencies(config.package_data)
        config.scripts = extract_scripts(config.package_data)
        
    if detection.has_requirements_txt:
        config.python_deps = parse_requirements(f"{project_path}/requirements.txt")
        
    # Build configuration
    config.build_setup = detect_build_configuration(project_path)
    
    return config
```

**Level 2: Directory Structure Analysis**
```python
def analyze_directory_structure(project_path: str) -> StructureAnalysis:
    """
    Segunda camada: Hierarquia de diretórios e organização
    """
    structure = StructureAnalysis()
    
    # Get full directory tree
    structure.tree = get_directory_tree(project_path)
    
    # Identify conventional directories
    conventional_dirs = {
        "src/": "source_code",
        "lib/": "library_code", 
        "components/": "ui_components",
        "pages/": "page_components",
        "api/": "api_routes",
        "services/": "service_layer",
        "models/": "data_models",
        "utils/": "utilities",
        "tests/": "test_files",
        "__tests__/": "jest_tests",
        "docs/": "documentation"
    }
    
    structure.recognized_dirs = identify_directories(project_path, conventional_dirs)
    structure.file_counts = get_file_counts_per_directory(project_path)
    
    return structure
```

**Level 3: Entry Points & Core Files**
```python
def identify_entry_points(project_path: str, detection: ProjectDetection) -> EntryPoints:
    """
    Terceira camada: Pontos de entrada e arquivos principais
    """
    entries = EntryPoints()
    
    # Common entry point patterns
    entry_patterns = {
        "javascript": ["index.js", "index.ts", "app.js", "app.ts", "main.js"],
        "react": ["src/index.js", "src/index.tsx", "src/App.js", "src/App.tsx"],
        "nextjs": ["pages/_app.js", "pages/_app.tsx", "src/pages/_app.tsx"],
        "python": ["main.py", "app.py", "manage.py", "__init__.py"],
        "django": ["manage.py", "wsgi.py", "settings.py"],
        "fastapi": ["main.py", "app.py"]
    }
    
    project_entries = entry_patterns.get(detection.primary_type, [])
    entries.main_files = find_existing_files(project_path, project_entries)
    
    return entries
```

**Level 4: Module & Component Analysis**
```python
def analyze_modules_and_components(project_path: str, detection: ProjectDetection) -> ModuleAnalysis:
    """
    Quarta camada: Módulos, componentes e organização lógica
    """
    modules = ModuleAnalysis()
    
    if detection.is_react_based:
        modules.components = analyze_react_components(project_path)
        modules.hooks = analyze_custom_hooks(project_path)
        modules.contexts = analyze_react_contexts(project_path)
        
    if detection.is_api_based:
        modules.routes = analyze_api_routes(project_path)
        modules.middleware = analyze_middleware(project_path)
        modules.controllers = analyze_controllers(project_path)
        
    if detection.is_python_based:
        modules.models = analyze_python_models(project_path)
        modules.views = analyze_python_views(project_path)
        modules.services = analyze_python_services(project_path)
    
    return modules
```

**Level 5: Testing & Quality Infrastructure**
```python
def analyze_testing_infrastructure(project_path: str) -> TestingAnalysis:
    """
    Quinta camada: Infraestrutura de testes e qualidade
    """
    testing = TestingAnalysis()
    
    # Test frameworks detection
    test_patterns = {
        "jest": ["jest.config.js", "package.json contains jest"],
        "pytest": ["pytest.ini", "conftest.py", "requirements contain pytest"],
        "vitest": ["vitest.config.js", "package.json contains vitest"],
        "cypress": ["cypress.json", "cypress/ directory"],
        "playwright": ["playwright.config.js", "package.json contains playwright"]
    }
    
    testing.frameworks = detect_test_frameworks(project_path, test_patterns)
    testing.test_files = find_test_files(project_path)
    testing.coverage_config = detect_coverage_setup(project_path)
    
    return testing
```

**Level 6: Deployment & Infrastructure**
```python
def analyze_deployment_infrastructure(project_path: str) -> DeploymentAnalysis:
    """
    Sexta camada: Deploy, CI/CD e infraestrutura
    """
    deployment = DeploymentAnalysis()
    
    # CI/CD detection
    ci_patterns = {
        ".github/workflows/": "github_actions",
        ".gitlab-ci.yml": "gitlab_ci",
        "azure-pipelines.yml": "azure_devops",
        "Jenkinsfile": "jenkins"
    }
    
    deployment.ci_systems = detect_ci_systems(project_path, ci_patterns)
    
    # Infrastructure detection
    deployment.containerization = detect_docker_setup(project_path)
    deployment.cloud_config = detect_cloud_configurations(project_path)
    deployment.environment_config = detect_env_configurations(project_path)
    
    return deployment
```

#### **2.2 Dependency Mapping & Integration Points**
```python
def map_dependencies_and_integrations(analysis: ProjectAnalysis) -> DependencyMap:
    """
    Mapeia dependências internas, externas e pontos de integração
    """
    dep_map = DependencyMap()
    
    # Internal dependencies (module imports, component relationships)
    dep_map.internal = analyze_internal_dependencies(analysis)
    
    # External dependencies (npm packages, pip packages, etc.)
    dep_map.external = analyze_external_dependencies(analysis)
    
    # API integrations (external services, databases, etc.)
    dep_map.integrations = identify_external_integrations(analysis)
    
    # Circular dependency detection
    dep_map.circular_deps = detect_circular_dependencies(analysis)
    
    return dep_map
```

### **Fase 3: Template Application & Consolidation (1-3min)**

#### **3.1 Template Selection**
```python
def select_appropriate_template(detection: ProjectDetection) -> TemplateChoice:
    """
    Seleciona template mais apropriado baseado na detecção
    """
    template_map = {
        "react_spa": "templates/react-spa-template.md",
        "vue_spa": "templates/vue-spa-template.md", 
        "nodejs_api": "templates/nodejs-api-template.md",
        "python_django": "templates/django-template.md",
        "python_fastapi": "templates/fastapi-template.md",
        "nextjs_fullstack": "templates/nextjs-template.md",
        "generic": "templates/generic-template.md"
    }
    
    template_path = template_map.get(detection.project_type, "templates/generic-template.md")
    confidence_threshold = 70
    
    if detection.confidence < confidence_threshold:
        template_path = "templates/generic-template.md"
        
    return TemplateChoice(
        path=template_path,
        type=detection.project_type,
        fallback_used=detection.confidence < confidence_threshold
    )
```

#### **3.2 Document Consolidation**
```python
def generate_consolidated_document(
    analysis: ProjectAnalysis, 
    template: TemplateChoice
) -> ConsolidatedDocument:
    """
    Gera documento final consolidado
    """
    doc = ConsolidatedDocument()
    
    # Load and customize template
    template_content = load_template(template.path)
    
    # Generate hybrid format (metadata + human readable)
    doc.metadata = generate_structured_metadata(analysis)
    doc.human_content = apply_template_with_data(template_content, analysis)
    
    # Combine in hybrid format
    doc.final_content = combine_metadata_and_content(doc.metadata, doc.human_content)
    
    return doc

def generate_structured_metadata(analysis: ProjectAnalysis) -> Dict[str, Any]:
    """
    Gera metadados estruturados para otimização de IA
    """
    return {
        "project_type": analysis.detection.project_type,
        "stack": analysis.detection.stack,
        "architecture_pattern": analysis.detection.architecture,
        "complexity_level": analysis.detection.complexity,
        "build_tool": analysis.detection.build_tool,
        "dependencies_count": len(analysis.dependencies.external),
        "test_frameworks": analysis.testing.frameworks,
        "deployment_type": analysis.deployment.primary_type,
        "last_analysis": datetime.now().isoformat(),
        "confidence_score": analysis.detection.confidence,
        "estimated_dev_hours": calculate_complexity_hours(analysis),
        "key_technologies": extract_key_technologies(analysis),
        "integration_points": count_integration_points(analysis),
        "performance_indicators": extract_performance_indicators(analysis)
    }
```

## 📊 **Output Format - Documento Consolidado Híbrido**

### **Estrutura Final do Output**
```markdown
---
# Metadados Estruturados para IA Processing
project_type: "react_spa"
stack: ["React", "TypeScript", "Vite", "Tailwind CSS"]
architecture_pattern: "Component-Based SPA"
complexity_level: "medium"
build_tool: "vite"
package_manager: "npm"
dependencies_count: 42
test_frameworks: ["jest", "react-testing-library"]
deployment_type: "static_hosting"
last_analysis: "2025-01-29T20:45:00Z"
confidence_score: 95
estimated_dev_hours: 320
key_technologies: ["React Hooks", "Context API", "React Router"]
integration_points: 3
performance_indicators: {
  "bundle_size_kb": 450,
  "lighthouse_score": 95,
  "load_time_ms": 800
}
---

# [ProjectName] - Análise Consolidada de Projeto

## 📋 Project Overview

**Tipo**: Single Page Application (SPA) React com TypeScript
**Stack Principal**: React 18.2 + TypeScript 5.0 + Vite 4.3
**Arquitetura**: Component-Based Architecture com Hooks
**Complexidade**: Média (42 componentes, 15 custom hooks)

### Quick Stats
- **Files**: 127 arquivos de código
- **Components**: 42 componentes React
- **Custom Hooks**: 15 hooks customizados
- **API Integration**: 3 endpoints REST
- **Bundle Size**: ~450KB (otimizado)
- **Test Coverage**: 85% (Jest + RTL)

## 🏗️ Architecture Analysis

### Component Architecture
```
src/
├── components/       # 42 componentes reutilizáveis
│   ├── ui/          # 18 componentes base (Button, Input, etc.)
│   ├── layout/      # 8 componentes de layout
│   └── feature/     # 16 componentes de funcionalidade
├── hooks/           # 15 custom hooks
├── contexts/        # 4 React contexts (Auth, Theme, etc.)
├── services/        # 6 serviços de API
└── utils/           # 12 funções utilitárias
```

### State Management Strategy
- **Local State**: useState + useReducer para componentes
- **Global State**: React Context API (4 contexts)
- **Server State**: React Query para cache de API
- **Form State**: React Hook Form para formulários

### Routing Architecture
- **Router**: React Router v6.10
- **Strategy**: Client-side routing com lazy loading
- **Protection**: Protected routes com auth guard
- **Structure**: Hierarchical routing com nested layouts

## 📚 Technology Stack

### Core Technologies
- **React**: 18.2.0 (hooks-based architecture)
- **TypeScript**: 5.0.4 (strict mode enabled)
- **Vite**: 4.3.9 (build tool + dev server)
- **React Router**: 6.10.0 (client-side routing)

### UI & Styling
- **Tailwind CSS**: 3.3.0 (utility-first styling)
- **Headless UI**: 1.7.15 (accessible components)
- **Heroicons**: 2.0.18 (icon system)

### Development & Quality
- **ESLint**: 8.38.0 (code linting)
- **Prettier**: 2.8.8 (code formatting)
- **Jest**: 29.5.0 (unit testing)
- **React Testing Library**: 13.4.0 (component testing)

### Build & Deployment
- **Build**: Vite bundler (SWC transpiler)
- **Deployment**: Static hosting ready
- **Environment**: Development/Production configs

## 🔧 Component Structure

### Component Hierarchy
```typescript
// Base UI Components (18 components)
Button, Input, Modal, Dropdown, Tooltip, Badge, etc.

// Layout Components (8 components)  
Header, Sidebar, Footer, Container, Grid, Section, etc.

// Feature Components (16 components)
UserProfile, ProductCard, ShoppingCart, SearchBar, etc.

// Page Components (12 components)
HomePage, ProductPage, CheckoutPage, ProfilePage, etc.
```

### Custom Hooks (15 hooks)
- `useApi()` - API integration with error handling
- `useAuth()` - Authentication state management  
- `useLocalStorage()` - Browser storage interface
- `useDebounce()` - Input debouncing
- `useForm()` - Form state management
- + 10 other specialized hooks

## 🔗 Integration Points

### External API Integration
1. **Authentication API**
   - Endpoint: `/api/auth`
   - Method: JWT-based authentication
   - Provider: Custom backend service

2. **Product API**  
   - Endpoint: `/api/products`
   - Method: REST API with pagination
   - Provider: E-commerce backend

3. **Payment Integration**
   - Provider: Stripe Elements
   - Methods: Credit card, PayPal
   - Security: PCI compliant

### Browser APIs Used
- **LocalStorage**: User preferences, cart data
- **SessionStorage**: Temporary data
- **Geolocation**: Location-based features
- **Notifications**: Push notifications

## 📊 Dependencies & Infrastructure

### Production Dependencies (28 packages)
**Core Framework**:
- react: 18.2.0
- react-dom: 18.2.0
- react-router-dom: 6.10.0

**UI & Styling**:
- tailwindcss: 3.3.0
- @headlessui/react: 1.7.15
- @heroicons/react: 2.0.18

**State & Data**:
- @tanstack/react-query: 4.29.5
- axios: 1.4.0
- react-hook-form: 7.44.3

**Utilities**:
- date-fns: 2.30.0
- lodash: 4.17.21
- clsx: 1.2.1

### Development Dependencies (14 packages)
- typescript: 5.0.4
- vite: 4.3.9
- eslint: 8.38.0
- prettier: 2.8.8
- jest: 29.5.0
- @testing-library/react: 13.4.0

### Build Configuration
- **Bundler**: Vite with SWC transpiler
- **Target**: ES2020, modern browsers
- **Output**: Optimized static assets
- **Code Splitting**: Automatic route-based splitting
- **Tree Shaking**: Enabled for optimal bundle size

### Performance Characteristics
- **Bundle Size**: ~450KB (gzipped: ~120KB)  
- **Load Time**: <800ms (3G connection)
- **Lighthouse Score**: 95+ (Performance, Accessibility)
- **First Contentful Paint**: <1.2s
- **Largest Contentful Paint**: <2.5s

## 🧪 Testing Strategy

### Testing Framework Setup
- **Unit Tests**: Jest + React Testing Library
- **Integration Tests**: MSW (Mock Service Worker)
- **E2E Tests**: None configured (recommended: Playwright)
- **Coverage**: 85% overall coverage

### Test Structure
```
src/
├── components/
│   └── __tests__/        # Component tests
├── hooks/
│   └── __tests__/        # Hook tests
├── services/
│   └── __tests__/        # Service tests
└── utils/
    └── __tests__/        # Utility tests
```

### Testing Patterns
- **Component Testing**: Render + user interactions
- **Hook Testing**: Custom hook behavior
- **Service Testing**: API integration mocking
- **Accessibility Testing**: a11y compliance

## 🚀 Development Workflow

### Available Scripts
- `npm run dev`: Start development server (Vite)
- `npm run build`: Production build 
- `npm run preview`: Preview production build
- `npm run test`: Run test suite
- `npm run lint`: ESLint check
- `npm run type-check`: TypeScript validation

### Development Environment
- **Node.js**: 18.16.0+ required
- **Package Manager**: npm (lockfile: package-lock.json)
- **IDE Setup**: VSCode recommended with extensions
- **Hot Reload**: Vite HMR enabled
- **Type Checking**: TypeScript strict mode

### Quality Gates
- **Pre-commit**: ESLint + Prettier
- **CI/CD**: Not configured (recommended: GitHub Actions)
- **Type Safety**: TypeScript strict mode
- **Code Standards**: ESLint + Prettier config

## 🔧 Configuration Files

### Primary Config Files
- `package.json`: Dependencies and scripts
- `tsconfig.json`: TypeScript configuration  
- `vite.config.ts`: Build configuration
- `tailwind.config.js`: Styling configuration
- `eslint.config.js`: Linting rules
- `jest.config.js`: Testing configuration

### Environment Configuration
- `.env.local`: Local development variables
- `.env.production`: Production environment
- No sensitive data in repository

## ⚠️ Challenges & Considerations

### Current Architecture Challenges
1. **State Management**: Could benefit from more structured state management (Redux Toolkit) as app grows
2. **Bundle Size**: Monitor bundle size as dependencies increase
3. **Testing**: E2E testing not configured (recommended for critical user flows)
4. **Performance**: Consider implementing virtual scrolling for large lists
5. **Accessibility**: Some components need better ARIA attributes

### Technical Debt
- [ ] Add E2E testing with Playwright
- [ ] Implement more comprehensive error boundaries
- [ ] Add performance monitoring (Web Vitals)
- [ ] Consider PWA features (service worker, offline support)
- [ ] Implement proper logging and monitoring

### Scalability Considerations
- **Code Splitting**: Currently using route-based splitting, consider component-based
- **State Management**: May need Redux/Zustand as complexity grows
- **API Layer**: Consider implementing proper API client with caching
- **Internationalization**: Not implemented, consider react-i18next for global markets

---

## 🔄 Ready for build-tech-docs

Este documento consolidado está otimizado para acelerar o processo do `/docs/build-tech-docs`:

✅ **Análise Estrutural Completa** - Detectado automaticamente como React SPA  
✅ **Stack Identificado** - React + TypeScript + Vite + Tailwind  
✅ **Arquitetura Mapeada** - Component-based com hooks e contexts  
✅ **Dependências Catalogadas** - 28 prod + 14 dev dependencies  
✅ **Performance Metrics** - Bundle size, load times, Lighthouse scores  
✅ **Challenges Identificados** - Debt técnico e oportunidades de melhoria  

**Próximo passo**: Use este documento como input para `/docs/build-tech-docs` para gerar a documentação técnica completa em 9 arquivos.
```

## 🔄 **Workflow de Execução**

### **Step-by-Step Process**

**1. Validation & Setup**
```bash
# Validate project path
if not os.path.exists(project_path):
    raise ProjectPathNotFoundError(f"Path não encontrado: {project_path}")

# Setup working directory and logging
setup_analysis_environment(project_path)
```

**2. Execute Analysis Pipeline**
```python
# Phase 1: Detection
initial_scan = initial_project_scan(project_path)
detection = invoke_docs_reverse_engineer(project_path, initial_scan)

# Phase 2: Hierarchical Analysis
config_analysis = analyze_configuration_layer(project_path, detection)
structure_analysis = analyze_directory_structure(project_path)
entry_analysis = identify_entry_points(project_path, detection)
module_analysis = analyze_modules_and_components(project_path, detection)
testing_analysis = analyze_testing_infrastructure(project_path)
deployment_analysis = analyze_deployment_infrastructure(project_path)

# Combine all analysis
full_analysis = ProjectAnalysis(
    detection=detection,
    config=config_analysis,
    structure=structure_analysis,
    entries=entry_analysis,
    modules=module_analysis,
    testing=testing_analysis,
    deployment=deployment_analysis
)

# Phase 3: Template & Consolidation
template = select_appropriate_template(detection)
consolidated_doc = generate_consolidated_document(full_analysis, template)
```

**3. Output Generation**
```python
# Generate final consolidated document
output_path = "docs/onion/consolidated-project-documentation.md"
save_consolidated_document(consolidated_doc, output_path)

# Validate output format
validate_hybrid_format(output_path)
validate_build_tech_docs_compatibility(output_path)
```

## 🧪 **Error Handling & Resilience**

### **Graceful Degradation**
```python
class RobustAnalyzer:
    def analyze_with_fallbacks(self, project_path: str) -> ProjectAnalysis:
        """
        Análise robusta com fallbacks para diferentes cenários
        """
        try:
            # Primary analysis path
            return self.full_analysis(project_path)
        except DetectionFailedException:
            # Fallback to generic analysis
            return self.generic_analysis(project_path)
        except FileAccessException as e:
            # Skip inaccessible files, continue with available ones
            return self.partial_analysis(project_path, excluded_files=e.files)
        except LargeProjectException:
            # Use sampling for very large projects
            return self.sampled_analysis(project_path, sample_rate=0.3)

    def handle_parsing_errors(self, file_path: str, error: Exception):
        """
        Handle individual file parsing errors gracefully
        """
        log.warning(f"Failed to parse {file_path}: {error}")
        # Continue analysis without this file
        return None
        
    def memory_management(self, project_size: int):
        """
        Adjust analysis depth based on project size
        """
        if project_size > 5000:  # files
            return AnalysisMode.SAMPLING
        elif project_size > 1000:
            return AnalysisMode.OPTIMIZED
        else:
            return AnalysisMode.FULL
```

### **Progress Reporting**
```python
def analyze_with_progress(project_path: str) -> ProjectAnalysis:
    """
    Análise com reporting de progresso
    """
    progress = ProgressReporter()
    
    progress.start("Iniciando análise de engenharia reversa...")
    
    # Phase 1
    progress.update(10, "Scanning projeto...")
    initial_scan = initial_project_scan(project_path)
    
    progress.update(20, "Detectando tipo de projeto...")
    detection = invoke_docs_reverse_engineer(project_path, initial_scan)
    
    # Phase 2  
    progress.update(30, "Analisando configuração...")
    config = analyze_configuration_layer(project_path, detection)
    
    progress.update(50, "Analisando estrutura...")
    structure = analyze_directory_structure(project_path)
    
    progress.update(70, "Analisando módulos...")
    modules = analyze_modules_and_components(project_path, detection)
    
    progress.update(85, "Analisando testes...")
    testing = analyze_testing_infrastructure(project_path)
    
    # Phase 3
    progress.update(95, "Consolidando documentação...")
    doc = generate_consolidated_document(analysis)
    
    progress.complete("✅ Análise concluída com sucesso!")
    
    return analysis
```

## 📊 **Success Metrics & Validation**

### **Quality Assurance Checks**
```python
def validate_consolidated_output(doc_path: str) -> ValidationResult:
    """
    Valida qualidade do documento consolidado
    """
    validation = ValidationResult()
    
    # Format validation
    validation.hybrid_format = validate_hybrid_format(doc_path)
    validation.metadata_complete = validate_metadata_completeness(doc_path)
    validation.human_readable = validate_human_readability(doc_path)
    
    # Content validation
    validation.technical_accuracy = validate_technical_accuracy(doc_path)
    validation.completeness_score = calculate_completeness_score(doc_path)
    validation.ai_optimization = validate_ai_optimization(doc_path)
    
    # Compatibility validation
    validation.build_tech_docs_compatible = test_build_tech_docs_integration(doc_path)
    
    return validation

def performance_benchmarks(project_path: str) -> BenchmarkResults:
    """
    Performance benchmarks for different project sizes
    """
    benchmarks = BenchmarkResults()
    
    # Measure analysis time by project size
    file_count = count_project_files(project_path)
    start_time = time.time()
    
    analysis = analyze_project(project_path)
    
    benchmarks.analysis_time = time.time() - start_time
    benchmarks.files_per_second = file_count / benchmarks.analysis_time
    benchmarks.memory_peak = get_peak_memory_usage()
    benchmarks.accuracy_score = calculate_detection_accuracy(analysis)
    
    return benchmarks
```

### **Success Criteria**
- **Detection Accuracy**: >95% para tipos de projeto comuns
- **Processing Speed**: <2min para projetos médios (1k arquivos)
- **Memory Efficiency**: <500MB peak usage
- **Integration Success**: 100% compatibilidade com build-tech-docs
- **Content Quality**: Documento legível para humanos e otimizado para IA
- **Completeness**: 90%+ das informações relevantes capturadas

## 🚀 **Usage Instructions**

### **Command Usage**
```bash
# Análise de projeto local
/docs/reverse-consolidate /path/to/my/project

# Análise de projeto específico com opções
/docs/reverse-consolidate /path/to/react/app --template=react_spa --output=custom-doc.md

# Análise com modo debug
/docs/reverse-consolidate /path/to/project --debug --verbose
```

### **Expected Output**
```bash
🔧 SISTEMA DE ENGENHARIA REVERSA INICIADO

━━━━━━━━━━━━━━━━━━━━━━━━

📂 PROJETO: /path/to/my/project
🔍 DETECTANDO: Tipo de projeto e stack...

✅ DETECÇÃO CONCLUÍDA:
   ▶ Tipo: React SPA (Confidence: 95%)
   ▶ Stack: React, TypeScript, Vite, Tailwind
   ▶ Complexidade: Média (127 arquivos)

🏗️ ANÁLISE HIERÁRQUICA:
   ▶ Configuração... ✅ (2.3s)
   ▶ Estrutura... ✅ (4.1s) 
   ▶ Módulos... ✅ (6.8s)
   ▶ Testes... ✅ (1.2s)
   ▶ Deploy... ✅ (0.9s)

📊 CONSOLIDAÇÃO:
   ▶ Template: react-spa-template.md
   ▶ Formato: Híbrido (metadados + humano)
   ▶ Tamanho: 15.2KB

✅ SUCESSO! Documento consolidado criado:
   📄 docs/onion/consolidated-project-documentation.md

🚀 PRÓXIMO PASSO:
   Execute: /docs/build-tech-docs docs/onion/consolidated-project-documentation.md

━━━━━━━━━━━━━━━━━━━━━━━━

⏰ Tempo total: 15.3s | 🎯 Ready for build-tech-docs
```

## 🎯 **Integration with Sistema Onion**

### **ClickUp Auto-Updates**
Este comando automaticamente atualiza o ClickUp durante execução:
- **Status updates** quando fases são completadas
- **Progress comments** com métricas e resultados
- **Time tracking** baseado na complexidade detectada
- **Tag management** baseado no tipo de projeto detectado

### **Session Management**
- **Context preservation**: Salva contexto da análise em `.cursor/sessions/`
- **Resumable operations**: Pode retomar análise interrompida
- **Progress tracking**: Acompanha progresso através de fases
- **Error recovery**: Recupera de erros mantendo progresso

### **Agent Integration**
- **@docs-reverse-engineer**: Core analysis agent (criado na Phase 1)
- **@documentation-writer**: Para refinamento final do documento
- **@research-agent**: Para contexto de tecnologias desconhecidas
- **@metaspec-gate-keeper**: Para validação final da arquitetura

---

## 🎬 **Status de Implementação**

**Phase 2 Implementation**: ✅ **COMANDO CRIADO - READY FOR INTEGRATION TESTING**

**Funcionalidades Implementadas**:
- ✅ Estrutura completa seguindo padrão Sistema Onion
- ✅ Workflow sequencial hierárquico (6 níveis de análise)
- ✅ Integração com @docs-reverse-engineer
- ✅ Error handling robusto com fallbacks
- ✅ Templates adaptativos por tipo de projeto
- ✅ Formato híbrido otimizado (metadados + humano)
- ✅ Validation & quality assurance completa
- ✅ Progress reporting e benchmarks

**Next Steps**:
1. Testar integração com @docs-reverse-engineer
2. Validar templates adaptativos (Phase 3)
3. Implementar testes end-to-end (Phase 4)
4. Validar compatibilidade com build-tech-docs
