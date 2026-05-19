import SandboxCore
import SwiftUI

/// Registers typed ``Story`` metadata and render closures for all built-in demo stories.
enum CoreSandboxStoriesRegistration {
    static func registerAll() {
        StoryRegistry.shared.reset()
        SandboxStoryRenderRegistry.shared.reset()

        register(AccordionStory.self) { theme in
            AnyView(AccordionStory.content(state: AccordionStory.defaultState, theme: theme))
        }
        register(AccordionItemStory.self) { theme in
            AnyView(AccordionItemStory.content(state: AccordionItemStory.defaultState, theme: theme))
        }
        register(AutocompleteStory.self) { theme in
            AnyView(AutocompleteStory.content(state: AutocompleteStory.defaultState, theme: theme))
        }
        register(AvatarStory.self) { theme in
            AnyView(AvatarStory.content(state: AvatarStory.defaultState, theme: theme))
        }
        register(AvatarGroupStory.self) { theme in
            AnyView(AvatarGroupStory.content(state: AvatarGroupStory.defaultState, theme: theme))
        }
        register(ButtonStory.self) { theme in
            AnyView(ButtonStory.content(state: ButtonStory.defaultState, theme: theme))
        }
        register(ButtonGroupStory.self) { theme in
            AnyView(ButtonGroupStory.content(state: ButtonGroupStory.defaultState, theme: theme))
        }
        register(ChipStory.self) { theme in
            AnyView(ChipStory.content(state: ChipStory.defaultState, theme: theme))
        }
        register(ChipGroupStory.self) { theme in
            AnyView(ChipGroupStory.content(state: ChipGroupStory.defaultState, theme: theme))
        }
        register(CollapsingNavigationBarStory.self) { theme in
            AnyView(CollapsingNavigationBarStory.content(state: CollapsingNavigationBarStory.defaultState, theme: theme))
        }
        register(CheckboxStory.self) { theme in
            AnyView(CheckboxStory.content(state: CheckboxStory.defaultState, theme: theme))
        }
        register(CheckboxGroupStory.self) { theme in
            AnyView(CheckboxGroupStory.content(state: CheckboxGroupStory.defaultState, theme: theme))
        }
        register(ProgressBarStory.self) { theme in
            AnyView(ProgressBarStory.content(state: ProgressBarStory.defaultState, theme: theme))
        }
        register(RadioboxStory.self) { theme in
            AnyView(RadioboxStory.content(state: RadioboxStory.defaultState, theme: theme))
        }
        register(RadioboxGroupStory.self) { theme in
            AnyView(RadioboxGroupStory.content(state: RadioboxGroupStory.defaultState, theme: theme))
        }
        register(ScrollbarStory.self) { theme in
            AnyView(ScrollbarStory.content(state: ScrollbarStory.defaultState, theme: theme))
        }
        register(SelectStory.self) { theme in
            AnyView(SelectStory.content(state: SelectStory.defaultState, theme: theme))
        }
        register(SpinnerStory.self) { theme in
            AnyView(SpinnerStory.content(state: SpinnerStory.defaultState, theme: theme))
        }
        register(SwitchStory.self) { theme in
            AnyView(SwitchStory.content(state: SwitchStory.defaultState, theme: theme))
        }
        register(TextAreaStory.self) { theme in
            AnyView(TextAreaStory.content(state: TextAreaStory.defaultState, theme: theme))
        }
        register(TextFieldStory.self) { theme in
            AnyView(TextFieldStory.content(state: TextFieldStory.defaultState, theme: theme))
        }
        register(TextFieldMasksStory.self) { theme in
            AnyView(TextFieldMasksStory.content(state: TextFieldMasksStory.defaultState, theme: theme))
        }
        register(CounterStory.self) { theme in
            AnyView(CounterStory.content(state: CounterStory.defaultState, theme: theme))
        }
        register(SegmentElementStory.self) { theme in
            AnyView(SegmentElementStory.content(state: SegmentElementStory.defaultState, theme: theme))
        }
        register(SegmentStory.self) { theme in
            AnyView(SegmentStory.content(state: SegmentStory.defaultState, theme: theme))
        }
        register(BadgeStory.self) { theme in
            AnyView(BadgeStory.content(state: BadgeStory.defaultState, theme: theme))
        }
        register(IndicatorStory.self) { theme in
            AnyView(IndicatorStory.content(state: IndicatorStory.defaultState, theme: theme))
        }
        register(CellStory.self) { theme in
            AnyView(CellStory.content(state: CellStory.defaultState, theme: theme))
        }
        register(CardStory.self) { theme in
            AnyView(CardStory.content(state: CardStory.defaultState, theme: theme))
        }
        register(BottomSheetStory.self) { theme in
            AnyView(BottomSheetStory.content(state: BottomSheetStory.defaultState, theme: theme))
        }
        register(CircularProgressBarStory.self) { theme in
            AnyView(CircularProgressBarStory.content(state: CircularProgressBarStory.defaultState, theme: theme))
        }
        register(DividerStory.self) { theme in
            AnyView(DividerStory.content(state: DividerStory.defaultState, theme: theme))
        }
        register(DrawerStory.self) { theme in
            AnyView(DrawerStory.content(state: DrawerStory.defaultState, theme: theme))
        }
        register(EditableStory.self) { theme in
            AnyView(EditableStory.content(state: EditableStory.defaultState, theme: theme))
        }
        register(ListStory.self) { theme in
            AnyView(ListStory.content(state: ListStory.defaultState, theme: theme))
        }
        register(ListItemStory.self) { theme in
            AnyView(ListItemStory.content(state: ListItemStory.defaultState, theme: theme))
        }
        register(OverlayStory.self) { theme in
            AnyView(OverlayStory.content(state: OverlayStory.defaultState, theme: theme))
        }
        register(TabBarStory.self) { theme in
            AnyView(TabBarStory.content(state: TabBarStory.defaultState, theme: theme))
        }
        register(TabBarIslandStory.self) { theme in
            AnyView(TabBarIslandStory.content(state: TabBarIslandStory.defaultState, theme: theme))
        }
        register(PopoverStory.self) { theme in
            AnyView(PopoverStory.content(state: PopoverStory.defaultState, theme: theme))
        }
        register(PaginationDotsStory.self) { theme in
            AnyView(PaginationDotsStory.content(state: PaginationDotsStory.defaultState, theme: theme))
        }
        register(CarouselStory.self) { theme in
            AnyView(CarouselStory.content(state: CarouselStory.defaultState, theme: theme))
        }
        register(FormItemStory.self) { theme in
            AnyView(FormItemStory.content(state: FormItemStory.defaultState, theme: theme))
        }
        register(TooltipStory.self) { theme in
            AnyView(TooltipStory.content(state: TooltipStory.defaultState, theme: theme))
        }
        register(ToastStory.self) { theme in
            AnyView(ToastStory.content(state: ToastStory.defaultState, theme: theme))
        }
        register(ModalStory.self) { theme in
            AnyView(ModalStory.content(state: ModalStory.defaultState, theme: theme))
        }
        register(NotificationStory.self) { theme in
            AnyView(NotificationStory.content(state: NotificationStory.defaultState, theme: theme))
        }
        register(RectSkeletonStory.self) { theme in
            AnyView(RectSkeletonStory.content(state: RectSkeletonStory.defaultState, theme: theme))
        }
        register(TextSkeletonStory.self) { theme in
            AnyView(TextSkeletonStory.content(state: TextSkeletonStory.defaultState, theme: theme))
        }
        register(DropDownMenuStory.self) { theme in
            AnyView(DropDownMenuStory.content(state: DropDownMenuStory.defaultState, theme: theme))
        }
        register(CodeFieldStory.self) { theme in
            AnyView(CodeFieldStory.content(state: CodeFieldStory.defaultState, theme: theme))
        }
        register(CodeInputStory.self) { theme in
            AnyView(CodeInputStory.content(state: CodeInputStory.defaultState, theme: theme))
        }
        register(LoaderStory.self) { theme in
            AnyView(LoaderStory.content(state: LoaderStory.defaultState, theme: theme))
        }
        register(WheelStory.self) { theme in
            AnyView(WheelStory.content(state: WheelStory.defaultState, theme: theme))
        }
        register(NavigationBarStory.self) { theme in
            AnyView(NavigationBarStory.content(state: NavigationBarStory.defaultState, theme: theme))
        }
        register(NoteStory.self) { theme in
            AnyView(NoteStory.content(state: NoteStory.defaultState, theme: theme))
        }
        register(NoteCompactStory.self) { theme in
            AnyView(NoteCompactStory.content(state: NoteCompactStory.defaultState, theme: theme))
        }
        register(TabsStory.self) { theme in
            AnyView(TabsStory.content(state: TabsStory.defaultState, theme: theme))
        }
        register(TabItemStory.self) { theme in
            AnyView(TabItemStory.content(state: TabItemStory.defaultState, theme: theme))
        }
        register(ToolbarStory.self) { theme in
            AnyView(ToolbarStory.content(state: ToolbarStory.defaultState, theme: theme))
        }
        register(MaskStory.self) { theme in
            AnyView(MaskStory.content(state: MaskStory.defaultState, theme: theme))
        }
    }

    private static func register<S: Story>(_ story: S.Type, render: @escaping (Theme) -> AnyView) {
        StoryRegistry.shared.register(story)
        SandboxStoryRenderRegistry.shared.register(id: S.id, render: render)
    }
}
