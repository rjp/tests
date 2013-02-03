{
	for(i=2;i<=NF;i++) {
		q="Total:"i
		f[q]=f[q]+$i
	}
}
END {
	for(i=3;i<=5;i++) {
		q="Total:"i
		gt=gt+f[q]
	}
	for(i in f) { 
		printf("%-10s %7.2f %5.2f%%\n", i, f[i], 100*f[i]/gt);
	}
}
