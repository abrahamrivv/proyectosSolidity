// SPDX-License-Identifier: GPL-3.0
 pragma solidity >=0.7.0 <0.9.0;
 
 contract DGTProject{
     //Aqui creamos nuestras variables
     enum State { Active, Inactive }

     struct Contribution {
         address contributior;
         uint value;
     }

     struct Project {
        string id;
        string name;
        State isFundable;
        string status;
        uint256 Goal; 
        uint256 totalFunded;
        address owner;
     }

     Project[] public projects;
     mapping(string => Contribution[]) public contributions;
     
     event projectCreated (
        string projectId,
        string name,
        uint Goal
     );

     event changeProjectStatus (
        address editor,
        string newStatus
     );

     event fundProjectEvent (
        address colaborator,
        uint amount
     );
     
     //No te  preocupes por esto,luego loaprenderemos. El modifier permite cambiar el comppoprtamiento de funciones, en este caso solo queria asegurarme que solo el creador del contrato pudiera mover el Goal
     modifier onlyOwner(uint projectIndex){
         require(msg.sender == projects[projectIndex].owner, "You need to be the owner from this contract to change the goal");
         _;
     }

     modifier ownerNotSendFunds(uint projectIndex){
         require(msg.sender != projects[projectIndex].owner, "Owner can't send funds for his own project");
         _;
     }
    
    //Inicializamoslos valores, en lugar del constructor usaremos la función createProject
     function createProject(string calldata id, string calldata name, uint goal) public {
         require(goal > 0, "Goal must be greater than 0");
         Project memory project = Project(id, name, State.Active, "active", goal, 0, msg.sender);
         projects.push(project);
         emit projectCreated(id, name, goal);
     }
     
     function viewGoal(uint projectIndex) public view returns(uint256) {
         Project memory project = projects[projectIndex];
         return project.Goal;
     }
     
     function changeProjectState(State change, uint projectIndex)public onlyOwner(projectIndex){
         Project memory project = projects[projectIndex];
         require(project.isFundable != change, "Can not change the state with the actual state");
         if(change == State.Active){
            project.status = "active";
         }else{
            project.status = "inactive";
         }
         project.isFundable = change;
         projects[projectIndex] = project;
         emit changeProjectStatus(msg.sender, project.status);
     }
     //Aqui inicia la funcion para fondear el proyecto
     function fundproject(uint projectIndex) public payable ownerNotSendFunds(projectIndex){
         Project memory project = projects[projectIndex];
        //El que fondea no debe ser el dueño del proyecto
         address whoFund = msg.sender;
         require(project.owner != whoFund, "The owner can't fund");
         //Primero evaluamos si el owner del contrato mantiene abiertas las donaciones (tal vez necesita reevaluar algo)
         require(project.isFundable == State.Active, "Owner has decided to stop this fundraising for a while. Stay tuned");
         //Comprobamos que el total que se ha fondeado sea menor a la meta
         require(project.totalFunded < project.Goal, "Goal already achieved so you aren't able to fund this anymore");
         //Despues nos aeguramos que la persona mande un minimo,en este caso arriba de 0
         require(msg.value != uint(0), "Please add some funds to  contribuite to DGT project");
         //Comprobamos que el valor que quiere fondear no exceda con a meta que tenemos
         require(project.totalFunded + msg.value <= project.Goal,"unable to add more funds, check amount remaining for our goal");
         //Actualizamos el total que se ha fondeado al contrato
         project.totalFunded += msg.value;
         //+= se denomina operador de asignación compuesta y sirve para sumarle una cantidad al valor de una variable. También se admite el uso del operador –= que en vez de sumar lo que hace es restar. El uso de los operadores de asignación compuesta es opcional: hay programadores que los usan y otros que no.
         projects[projectIndex] = project;
         contributions[project.id].push(Contribution(msg.sender, msg.value));
         emit fundProjectEvent(msg.sender, msg.value);
     }
     //Esta funcion nos sirve para que la persona pueda ver cuanto se necesita para alcanzar la meta, asi no tendra que estar adivinando cuanto depositar máximo
     function viewRemaining(uint projectIndex) public view returns(uint256){
         Project memory project = projects[projectIndex];
         uint256 remainingFunds = project.Goal - project.totalFunded;
         return remainingFunds;
     }
     
 }