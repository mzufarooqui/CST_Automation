function [s11,s21,s12,s22,freq] = f_read8510(FileName,varargin)
%------------------------------------------------------------
% function [s11,s21,s12,s22,freq] = f_read8510(FileName,varargin)
% legge il file generato dal network 8510 e memorizzato
% nella forma di DATA.
% se il secondo parametro esiste produce  anche un grafico.
%  's11' 's21' 's12' 's22'  == il gafico corrispondente sulla figura corrente.
%  'all'                    == tutti i parametri su una figura interna
%                               e valuta la banda sul coeff. di Riflessione
% CESPA  29/3/1999
%--------------------------------------------------
fid = fopen(FileName);
dum =  fscanf(fid,'%*s ',28); % salta 28 parole
freqMin =  fscanf(fid,'%f ',1)/1.e9; % GHz
freqMax =  fscanf(fid,'%f ',1)/1.e9; % GHz
Nfreq = fscanf(fid,'%f ',1); % numero di punti
freq = linspace(freqMin,freqMax,Nfreq);
dum =  fscanf(fid,'%*s ',10); % salta 10 parole
data = fscanf(fid,'%f ',6);
str = sprintf('%d,%d,%d,%d,%d,%d',data);
dataForm = eval(['datestr(datenum(',str,'))']);
%----------------------------
fprintf(1,' ------------------------------------------\n') 
fprintf(1,' Data file name :          %s \n', FileName) 
fprintf(1,' the Measurements is done: %s\n',dataForm)
fprintf(1,' frequency Range = [%1.3f - %1.3f] GHz; No. of Points: %3d \n',...
   freqMin,freqMax,Nfreq)
%-------------------------------------
nomi = ['s11';'s21';'s12';'s22'];
i = 0;
while i<4
   i = i+1;

   
   inizio = fscanf(fid,'%s',1); % legge BEGIN
   if strcmp(inizio,'BEGIN')
      dati = fscanf(fid,'%f, %f',[2,Nfreq]);
      eval([nomi(i,:),' = dati(1,:)+j*dati(2,:);']); %caricamento su sij
      %eval([nomi(i,:),' = 10.^(dati(1,:)/20);']); % caricamento su sij da  dB

   else
      error('lettura non possibile: non trovato BEGIN')
   end %  if strcmp(beg,'BEGIN')
   fine = fscanf(fid,'%s',1); % lettura END
end % while i<4
err = fclose(fid);


%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%--------- plot dei dati
Dis = 'niente';
if ~isempty(varargin)% disegna i dati
   Dis = varargin{1};
   switch lower(Dis)
   case 's11'
      plot(freq,20*log10(abs(s11)));
   case 's21'
      plot(freq,20*log10(abs(s21)));
   case 's12'
      plot(freq,20*log10(abs(s12)));
   case 's22'
      plot(freq,20*log10(abs(s22)));
   otherwise
      titoloFig = sprintf(' Measured Data: %s;  %s', FileName,dataForm);
      [FigExist HFR]=figflag(titoloFig,0);
      
      if FigExist==0
         HFR = figure(...
            'Name',titoloFig, ...                             
            'NumberTitle','off',...         
            'units','normalized',...
            'position',[0.0008    0.1943    0.5250    0.7627],...
            'paperUnits','centimeters',...
            'paperPosition',[1.7868 2.4594 18 23]) ;
      else
         figure(HFR)
         clf
      end % 	if FigExist==0
      
      xS = 0.1;
      yS = 0.05	;
      wS=  0.85	;
      hS = 0.425	;
      HADown = axes( ...
         'Units','normalized', ...
         'Position',[xS,yS,wS,hS], ...
         'Visible','on');
      xG = 0.1 ;
      yG = 0.525 ;
      wG=  0.85	;
      hG = 0.425;
      HAUp = axes( ...
         'Units','normalized', ...
         'Position',[xG,yG,wG,hG], ...
         'Visible','on');
      
      %---------------------------------------------------
      LineW = 2; % spessore linea grafici
      FontSize = 8; % dimensione scritte
      
      figure(HFR)
      axes(HAUp)
      set(gca,'fontSize',FontSize)
      plot(freq,20*log10(abs(s21)), freq,20*log10(abs(s12)),'linewidth',LineW)
      axis([-inf,inf,-90,5])
      grid on
      xlabel('frequency (GHz)')
      ylabel('S_{21};   S_{12} (dB)')
      title(titoloFig)
      %----------------------------------------
      axes(HADown)
      set(gca,'fontSize',FontSize)
      plot(freq,20*log10(abs(s11)), freq,20*log10(abs(s22)),'linewidth',LineW)
      axis([-inf,inf,-50,5])
      grid on
      xlabel('frequency (GHz)')
      ylabel('S_{11};   S_{22} (dB)')
      
   end %switch lower(Dis)
end % if ~isempty(varargin)% disegna i dati

if strcmp(lower(Dis),'all')

   risp = input('  ? Bandwidth Evaluation (y|n) : ','s');
   if strcmp(lower(risp),'y')
      
      axes(HADown)
      %--------------- valutazione valghezza di banda s11 -----------------------
      fprintf(1,'\n--\n')
      fprintf(1,'  S11 Bandwidth Evaluation: pick lower-upper freq. on red curve \n')
      hold on
      hp =  plot(freq,20*log10(abs(s11)),'r--');
      Pxy = ginput(2);
      Pxy = Pxy(:,1);
      PfreqMin = min(Pxy);
      PfreqMax = max(Pxy);
      [dum,ib]  = min(abs(freq-PfreqMin));
      [dum,ie]  = min(abs(freq-PfreqMax));
      %[freq01,deltaFreq1,RlossdB1,InsL1] = f_banda(freq(ib:ie),s11(ib:ie),s21(ib:ie));
      %fprintf(1,'\n')
      %fprintf(1,' S11,S21 : freq0 = %4.4f GHz; bandwidth at %2.2f.dB = %3.0f MHz;\n',...
      %   freq01,RlossdB1,deltaFreq1*1000)
      %fprintf(1,'           Insertion Loss (Min - Max)  = (%1.3f - %1.3f)dB \n',...
      %   InsL1)
      %------------------------------------------------------------
      %--------------- valutazione valghezza di banda s22 -----------------------
      fprintf(1,'\n--\n')
      fprintf(1,'  S22 Bandwidth Evaluation: pick lower-upper freq. on red curve \n')
      set(hp,'ydata', 20*log10(abs(s22)));
      Pxy = ginput(2);
      Pxy = Pxy(:,1);
      PfreqMin = min(Pxy);
      PfreqMax = max(Pxy);
      [dum,ib]  = min(abs(freq-PfreqMin));
      [dum,ie]  = min(abs(freq-PfreqMax));
      %[freq02,deltaFreq2,RlossdB2,InsL2] = f_banda(freq(ib:ie),s22(ib:ie),s12(ib:ie));
      %fprintf(1,' S22,S12 : freq0 = %4.4f GHz; bandwidth at %2.2f.dB = %3.0f MHz;\n',...
      %   freq02,RlossdB2,deltaFreq2*1000)
      %fprintf(1,'           Insertion Loss (Min - Max)  = (%1.3f - %1.3f)dB \n',...
      %   InsL2)
      set(hp,'vis','off');
   end % if strcmp(lower(Dis),all)
end % if strcmp(lower(risp),'y')


return

