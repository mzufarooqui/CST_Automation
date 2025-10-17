 function dataTimeStr = dataTimeString()
 c = clock;
[token1, remain1] = strtok(date,'-');
[token2, remain2] = strtok(remain1,'-');
[token3, remain3] = strtok(remain2,'-');
dataTimeStr = [ token1 token2 token3 '_' num2str(c(4)) '_' num2str(c(5)) ];