#include <sstream>
#include <gsl/gsl_matrix.h>
#include <gsl/gsl_linalg.h>
#include <gsl/gsl_cblas.h>


// pretty print
std::string ppMatrix(const gsl_matrix *m) {
    std::ostringstream str;
    int r, c;

    str << "";
    for (r = 0; r < (int) m->size1; r++) {
        for (c = 0; c < (int) m->size2; c++) {
            str << gsl_matrix_get(m, r, c);
            if (c < m->size2 - 1) {
                str << " ";
            }
        }
        str << "\n";
    }
    return str.str();
}

void
matrixInverseCheck() {
	// Define the dimension n of the matrix
	// and the signum s (for LU decomposition)
	int n = 2;
	int s;
	
	// Define all the used matrices
	gsl_matrix * m = gsl_matrix_alloc (n, n);
	gsl_matrix * inverse = gsl_matrix_alloc (n, n);
	gsl_permutation * perm = gsl_permutation_alloc (n);
	
	// Fill the matrix m
        gsl_matrix_set (m, 0, 0, 0.378589);
        gsl_matrix_set (m, 0, 1, 0.971711);
        gsl_matrix_set (m, 0, 2, 0.016087);
        gsl_matrix_set (m, 0, 3, 0.037668);
        gsl_matrix_set (m, 0, 4, 0.312398);

        gsl_matrix_set (m, 1, 0, 0.756377);
        gsl_matrix_set (m, 1, 1, 0.345708);
        gsl_matrix_set (m, 1, 2, 0.922947);
        gsl_matrix_set (m, 1, 3, 0.846671);
        gsl_matrix_set (m, 1, 4, 0.856103);

        gsl_matrix_set (m, 2, 0, 0.732510);
        gsl_matrix_set (m, 2, 1, 0.108942);
        gsl_matrix_set (m, 2, 2, 0.476969);
        gsl_matrix_set (m, 2, 3, 0.398254);
        gsl_matrix_set (m, 2, 4, 0.507045);

        gsl_matrix_set (m, 3, 0, 0.162608);
        gsl_matrix_set (m, 3, 1, 0.227770);
        gsl_matrix_set (m, 3, 2, 0.533074);
        gsl_matrix_set (m, 3, 3, 0.807075);
        gsl_matrix_set (m, 3, 4, 0.180335);

        gsl_matrix_set (m, 4, 0, 0.517006);
        gsl_matrix_set (m, 4, 1, 0.315992);
        gsl_matrix_set (m, 4, 2, 0.914848);
        gsl_matrix_set (m, 4, 3, 0.460825);
        gsl_matrix_set (m, 4, 4, 0.731980);

	// Make LU decomposition of matrix m
	gsl_linalg_LU_decomp (m, perm, &s);
	
	// Invert the matrix m
	gsl_linalg_LU_invert (m, perm, inverse);
}


void
matrixOpsCheck() {
    fprintf(stdout, "\n Matrix Operations ..............................................\n");
    int L = 3, M = 3;
    int i, j;
    gsl_matrix *m = gsl_matrix_alloc(L, M);

    for (i = 0; i < L; i++)
        for (j = 0; j < M; j++)
            gsl_matrix_set(m, i, j, 0.23 + 100 * i + j);

    fprintf(stdout, "m = %s\n", ppMatrix(m).c_str());

    gsl_matrix_free(m);

    fprintf(stdout, "\n");
}

int
main(void) {
    matrixOpsCheck();

    return 0;
}
