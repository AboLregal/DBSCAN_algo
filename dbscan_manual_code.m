clc;clear;close all
dat=xlsread('a.xlsx');
mnpts=2;
e=200;


D=pdist2(dat,dat);
n=size(D,1);
De=(D<=e&D>0);
De(1:n+1:end)=0; % Linear Indexing

for i=1:n
    r1=De(:,i);
    y1=find(r1==1);
    j=[i;y1];
    if isempty(y1)
        idx(i)=-1;
        continue
    end
    for i2=1:length(y1)
        r2=De(:,y1(i2));
        y2=find(r2==1);
        j=[j;y2];
    end
    G{i,1}=unique(j');
end

j2=[];count=1;
for i=1:n
    if ~ismember(i,j2)
        r=G{i};
        j3=cat(2,G{r});
        temp=unique(j3);
        r=temp;
        d=1;
        while d>0
            j3=cat(2,G{r});
            j3_u=unique(j3);
            d=length(j3_u)-length(temp);
            if d>0
                temp=j3_u;
            end
            r=j3_u;
        end
        j2=[j2 r];
        G2{count,1}=r;
        count=count+1;
    end
end

idx=zeros(n,1)-1;
count=1;count2=1;
for i=1:length(G2)
    r=G2{i};
    if length(r)>=mnpts
        idx(r)=count;
        count=count+1;
        G3{count2}=r;
        count2=count2+1;
    end
end
G3{count2}=find(idx==-1);

idx2=dbscan(dat,e,mnpts);
figure;gscatter(dat(:,1),dat(:,2),idx);title('My DBSCAN algorithm')
figure;gscatter(dat(:,1),dat(:,2),idx2);title('MatLab DBSCAN algorithm')