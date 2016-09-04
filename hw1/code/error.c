#include<stdio.h>
#include<math.h>
double calculate_error(double data[][2], double p[], int N, int degree ){
    double err=0,y;
    int i,j;
    for( i=0; i<N;i++ ){
        y=0;
        for( j=0; j<degree; j++)
            y+=p[degree-j-1]*pow(data[i][0],j);

        err+=pow(y-data[i][1],2);
    }
    err=sqrt(err/N);
    return err;
}
int main(){
                            //Configured for big training data 0 degree polynomial
    FILE *f1,*f2,*f3,*f4,*f5;
    f1=fopen("pb0.txt","r");            //pb1,pb2,pb3,pb5,pb9(for big training data) p0,p1,p2,p3,p5,p9(for small training data)
    f2=fopen("trainbig.txt","r");       // trainbig.txt for big training data & trainsmall.txt for small training data
    f3=fopen("test.txt","r");
    f4=fopen("valid.txt","r");
    f5=fopen("errb0.txt","w");          // errb0,.., errb9 (for big training data) errs0,...,errs9 (for small training data
    int deg,i;
    fscanf(f1,"%d ",&deg);
    deg++;
    double p[deg];
    for( i=0; i<deg; i++)fscanf(f1,"%lf ",&p[i]);
    double train_data[76][2];                                                        //76 for big training data and 10 for small training data
    double test_data[35][2];
    double valid_data[9][2];
    for( i=0;i<76;i++)fscanf(f2,"%lf %lf ",&train_data[i][0],&train_data[i][1]);     //76 for big training data and 10 for small training data
    for( i=0;i<35;i++)fscanf(f3,"%lf %lf ",&test_data[i][0],&test_data[i][1]);
    for( i=0;i<9;i++)fscanf(f4,"%lf %lf ",&valid_data[i][0],&valid_data[i][1]);
    double train_err=calculate_error(train_data,p,10,deg);
    double test_err=calculate_error(test_data,p,76,deg);                              //76 for big training data and 10 for small training data
    double valid_err=calculate_error(valid_data,p,9,deg);
    fprintf(f5,"%lf\n",train_err);
    fprintf(f5,"%lf\n",test_err);
    fprintf(f5,"%lf",valid_err);
    return 0;
}
