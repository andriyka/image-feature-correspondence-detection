%EVALUATE - automatically executes student solutions with standardized 
%           test and generate html pages
%
%IMPORTANT security notice: 
%  Since the code of a student is executed automatically, a malicious code 
%  inserted by a student within his/her function is a security issue. Use
%  strictly limited permissions or consider a virtual machine. 
%  
%  The time student codes cannot be limited. If a student's code takes too
%  long or even gets stuck, the entire evaluation gets stuck.
%


TEST_DIR = './MPV-eval/'; %directory, where standardized test are located
UPLOAD_DIR = './';  %directory where student solutions (zip files are located)
EVAL_DIR = './EVAL1/'; %directory with the resulting html pages

TASKS = 0:4;  %tasks to evaluate (dafault is 0:4)

%%

D = dir('*.zip'); 
if ~isempty(D)
	mkdir(EVAL_DIR)
else
	error('No zip file was found.')
end

for i=1:length(D) %per student
	
	folder = [EVAL_DIR, D(i).name(1:end-4)]; 
	mkdir(folder);
	unzip(D(i).name(1:end-4), folder); %extract student solution
	
	%copy standardized tests
	copyfile(TEST_DIR, folder)

	%execute tests and produce html
	cpwd = pwd;
	for t=TASKS %per tasks
		try
			cd(sprintf('%s/%s/task_%i',cpwd, folder, t))
			
			save('tmp');
			close all; clear all;
			publish('test.m'); %=> html/test.html
			close all; clear all; 
			load('tmp');
			
		catch
			load;
			fprintf('Execution of test %i for "%s" failed.\n', t, D(i).name(1:end-4))
		end
	end
	cd(cpwd)
	
end