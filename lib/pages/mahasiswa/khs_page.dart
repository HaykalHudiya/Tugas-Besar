import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_tugas_besar/bloc/Khs/khs_bloc.dart';
import 'package:flutter_template_tugas_besar/data/datasource/auth_local_datasource.dart';
import 'package:flutter_template_tugas_besar/data/models/response/auth_response_model.dart';
// import 'package:bloc/bloc.dart';
import '../../common/components/custom_scaffold.dart';
import '../../common/components/row_text.dart';
import '../../common/constants/colors.dart';

class KhsPage extends StatefulWidget {
  const KhsPage({super.key});

  @override
  State<KhsPage> createState() => _KhsPageState();
}

class _KhsPageState extends State<KhsPage> {
  late Future<User?> _userFuture;

  @override
  void initState() {
    super.initState();
    _userFuture = AuthLocalDatasource().getUser();
    // context.read<KhsBloc>().add(const KhsEvent.getKhs());
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const Text(
            "KHS Mahasiswa",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "14 of 64 results",
                style: TextStyle(
                  color: ColorName.grey,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.filter_list),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          FutureBuilder<User?>(
            future: _userFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (!snapshot.hasData || snapshot.data == null) {
                return const SizedBox(); // Handle jika data tidak tersedia
              } else {
                User user = snapshot.data!;
                return ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  leading: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                    child: Image.asset(
                      'assets/images/profile.jpg',
                      height: 40.0,
                      width: 40.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    user.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  subtitle: Text(
                    user.roles,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                );
              }
            },
          ),
          //
          const SizedBox(height: 16.0),
          const Divider(),
          const SizedBox(height: 16.0),
          const RowText(
            label: 'Mata Kuliah :',
            value: 'Nilai :',
            labelColor: ColorName.primary,
            valueColor: ColorName.primary,
          ),
          const SizedBox(height: 14.0),
          const RowText(
            label: 'Basis Data',
            value: 'C',
          ),
          const SizedBox(height: 12.0),
          const RowText(
            label: 'Struktur Data',
            value: 'A',
          ),
          const SizedBox(height: 12.0),
          const RowText(
            label: 'Algoritma',
            value: 'A',
          ),
          const SizedBox(height: 12.0),
          const RowText(
            label: 'Pemrograman Berbasis Obyek',
            value: 'A',
          ),
          const SizedBox(height: 12.0),
          const RowText(
            label: 'Keterangan',
            value: 'A',
          ),
          const SizedBox(height: 40.0),
          const RowText(
            label: 'IPK Semester :',
            value: '3.18',
            labelColor: ColorName.primary,
            valueColor: ColorName.primary,
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 3),
        ],
      ),
    );
  }
}

// ListTile buildUserProfile(User user) {
//   return ListTile(
//     contentPadding: const EdgeInsets.all(0),
//     leading: ClipRRect(
//       borderRadius: const BorderRadius.all(Radius.circular(50.0)),
//       child: Container(
//         width: 72.0,
//         height: 72.0,
//         color: Colors.blue, // Warna latar belakang avatar
//         alignment: Alignment.center,
//         child: Text(
//           user.name,
//           style: const TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 24.0,
//           ),
//         ),
//       ),
//     ),
//     title: Text(
//       user.name,
//       style: const TextStyle(
//         fontSize: 16,
//         fontWeight: FontWeight.w700,
//       ),
//     ),
//     subtitle: Text(
//       user.roles,
//       style: const TextStyle(
//         fontSize: 12,
//       ),
//     ),
//   );
// }
