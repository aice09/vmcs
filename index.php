<?php 
require_once 'environment.php';

$view = (isset($_GET['page']) && $_GET['page'] != '') ? $_GET['page'] : '';
switch ($view) {
	//Sales
    case 'jobs' :
        $title="Jobs";  
        $content='pages/sys_user/jobs.php';        
        break;
    
    case 'jobs-details' :
        $title="Jobs";  
        $content='pages/sys_user/jobs_details.php';        
        break;

    //Coordinator
    case 'coordinator-toassign' :
        $title="To Assign";  
        $content='pages/sys_user/coordinator_toassign.php';        
        break;

    case 'coordinator-review' :
        $title="To Review";  
        $content='pages/sys_user/coordinator_review.php';        
        break;
    
    case 'coordinator-done' :
        $title="Done";  
        $content='pages/sys_user/coordinator_done.php';        
        break;

    //Prepress
    case 'ppress-todo' :
        $title="To Do";  
        $content='pages/sys_user/ppress_todo.php';        
        break;

    case 'ppress-done' :
        $title="Done";  
        $content='pages/sys_user/ppress_done.php';        
        break;
    
    default :
        $title="Home";  
        $content ='pages/sys_user/home.php';     
}

require_once 'template/sys_user/body.php';
require_once 'config/idle.php';
?>