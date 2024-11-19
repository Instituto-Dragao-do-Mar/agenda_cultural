import 'package:flutter/material.dart';
import 'package:agendacultural/model/cores.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/space.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/spaces/item/item_space_info.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/spaces/item/item_space_image.dart';

class ItemSpaceWidget extends StatelessWidget {
  final Space space;
  final void Function() onTapSpace;

  const ItemSpaceWidget({
    super.key,
    required this.space,
    required this.onTapSpace,
  });

  @override
  Widget build(BuildContext context) {
    if (space.espacosimagens == null || space.espacosimagens?.isEmpty == true) {
      return const SizedBox.shrink();
    }

    return GestureDetector(
      onTap: onTapSpace,
      child: Container(
        margin: const EdgeInsets.all(8),
        height: 270 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
        width: 180 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: !Cores.contraste ? const Color(0xFFF6F6F6) : Colors.black.withOpacity(.8),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(.2), blurRadius: 3, offset: const Offset(0, 0))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemSpaceImageWidget(
              urlImage: space.espacosimagens?.first.imagens?.first.url,
            ),
            ItemSpaceInfo(
              nameSpace: space.nome,
              address: space.endereco ?? '',
            ),
          ],
        ),
      ),
    );
  }
}
