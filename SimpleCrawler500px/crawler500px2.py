import urllib
import time
import random
import re
url = 'https://500px.com/popular.rss'
print(url)
path1='G:\\dl500px\\'

# load previous pic list
frec = open(path1+'dlrec.txt','r')
d = frec.readlines()
frec.close()
piclistprev={}
for line in d:
    key, value = line.strip().split(',')
    piclistprev[key]=int(value)

# read rss file, and filter the urls out
page = urllib.urlopen(url)
data = page.read()
print(data)
piclist=re.findall('<img src="(.+)"></a>',data)
print(piclist)

# download pics
piclistnew={}
for picurl in piclist:
	flag=0
	picname=picurl[-32:]
	if picname in piclistprev:
		flag=piclistprev[picname]
	if flag==0:
		time.sleep(random.random()*10+15)
		print(path1+picname+'.jpg')

		
		f = open(path1+picname+'.jpg','wb')
		try:
			content = urllib.urlopen(picurl).read()
			f.write(content)
			piclistnew[picname]=1
		except Exception, e:
			#raise e
			piclistnew[picname]=0
		finally:
			f.close()
			
##		piclistnew[picname]=1

# add new list in the blog
frec = open(path1+'dlrec.txt','a+')
for line in piclistnew:
    frec.write(line+','+str(piclistnew[line])+'\n')
frec.close()
